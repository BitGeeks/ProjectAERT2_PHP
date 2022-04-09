import { Component, EventEmitter, HostListener, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { Store } from '@ngrx/store';
import { NotifierService } from 'angular-notifier';
import { Observable, throwError } from 'rxjs';
import { catchError, take } from 'rxjs/operators';
import { AdminService } from 'src/app/services/admin.service';
import { ImageService } from 'src/app/services/image-service.service';
import { BrowseState } from 'src/app/store/browse/browse.reducer';
import { ImageSnippet } from 'src/app/store/ImageSnippet';
import { Algorithm, processImage, productImage, productinventory } from 'src/app/store/model';
import * as fromApp from '../../../store/app.reducers';
import * as BrowseActions from '../../../store/browse/browse.actions';

@Component({
  selector: 'app-edit-product-dialog',
  templateUrl: './edit-product-dialog.component.html',
  styleUrls: ['./edit-product-dialog.component.scss']
})
export class EditProductDialogComponent implements OnInit {
  editProduct: FormGroup;
  browseState: Observable<BrowseState>;

  algorithmList: Array<Algorithm>;
  selectedFile: ImageSnippet;
  dragAreaClass: string;

  isUploading = false;
  currentBinaryFile: string = null;
  fileName: string = null;
  currentNode = 0;

  productimages: Array<processImage> = [];

  @Input()
  public initialState: { [key: string]: any };

  @Output()
  public FormSubmittedEv = new EventEmitter<boolean>();

  @Output()
  public FormExceptionOccurEv = new EventEmitter<string>();

  @Output()
  public FormCloseEv = new EventEmitter<boolean>();

  constructor(
    private store: Store<fromApp.AppState>,
    public activeModal: NgbActiveModal,
    private adminService: AdminService,
    private notifierService: NotifierService,
    private imageService: ImageService
  ) { }

  ngOnInit(): void {
    this.dragAreaClass = 'dragarea';

    this.browseState = this.store.select('browse');
    this.editProduct = new FormGroup({
      id: new FormControl(null, [Validators.required]),
      name: new FormControl(null, [Validators.required]),
      desc: new FormControl(null, []),
      notedesc: new FormControl(null, []),
      detaildesc: new FormControl(null, []),
      paymentdesc: new FormControl(null, []),
      warrantydesc: new FormControl(null, []),
      sku: new FormControl(null, [Validators.required]),
      category_id: new FormControl(null, [Validators.required]),
      algorithm_id: new FormControl(null, [Validators.required]),
      price: new FormControl(null, [Validators.required]),
      pricepromotion: new FormControl(null, [Validators.required]),
      quantity: new FormControl(null, [Validators.required]),
      flag: new FormControl(null, []),
      hps: new FormControl(null, [Validators.required]),
      weight: new FormControl(null, [Validators.required]),
      shippinginfo: new FormControl(null, [])
    });
    this.editProduct.patchValue({
      id: this.initialState.id,
      name: this.initialState.name,
      desc: this.initialState.desc,
      notedesc: this.initialState.notedesc,
      detaildesc: this.initialState.detaildesc,
      paymentdesc: this.initialState.paymentdesc,
      warrantydesc: this.initialState.warrantydesc,
      sku: this.initialState.sku,
      category_id: this.initialState.category_id,
      algorithm_id: this.initialState.algorithm_id,
      price: this.initialState.price,
      pricepromotion: this.initialState.pricepromotion,
      quantity: this.initialState.productinventory.quantity,
      flag: this.initialState.productinventory.flag,
      hps: this.initialState.productinventory.hps,
      weight: this.initialState.productinventory.weight,
      shippinginfo: this.initialState.productinventory.shippinginfo
    });

    this.browseState.pipe(take(1)).subscribe(data => {
      if (data.categories.length === 0) {
        this.store.dispatch(new BrowseActions.FetchCategory());
      }
    });

    this.processImages();
    this.getAlgorithmList();
  }

  @HostListener('dragover', ['$event']) onDragOver(event: any) {
    this.dragAreaClass = 'droparea';
    event.preventDefault();
  }
  @HostListener('dragenter', ['$event']) onDragEnter(event: any) {
    this.dragAreaClass = 'droparea';
    event.preventDefault();
  }
  @HostListener('dragend', ['$event']) onDragEnd(event: any) {
    this.dragAreaClass = 'dragarea';
    event.preventDefault();
  }
  @HostListener('dragleave', ['$event']) onDragLeave(event: any) {
    this.dragAreaClass = 'dragarea';
    event.preventDefault();
  }
  @HostListener('drop', ['$event']) onDrop(event: any) {
    this.dragAreaClass = 'dragarea';
    event.preventDefault();
    event.stopPropagation();
    if (event.dataTransfer.files) {
      const files: FileList = event.dataTransfer.files;
      this.processFile({ files });
    }
  }

  onAdminClickRemoveImage(imageUrl) {
    this.adminService.removeProductImage(this.initialState.id, imageUrl)
      .pipe(take(1), catchError(
        error => {
          this.productimages = this.productimages.filter(d => d.imageUrl !== imageUrl);
          return throwError(error);
        }
      ))
      .subscribe(() => {
        this.productimages = this.productimages.filter(d => d.imageUrl !== imageUrl);
        this.FormSubmittedEv.emit(true);
    });
  }

  processImages() {
    if (this.initialState.productimages.length !== 0) {
      this.initialState.productimages.map((data, idx) => {
        this.productimages.push({
          imageUrl: data.imageUrl,
          alt_Name: data.alt_Name
        });
      });
    }
  }

  onEditSubmitted() {
    if (!this.editProduct.valid) { return; }
    const { id, name, desc, notedesc, detaildesc, paymentdesc, warrantydesc, sku, category_id, algorithm_id, price, pricepromotion, quantity, flag, hps, weight, shippinginfo } = this.editProduct.value;
    const productImage = this.productimages;
    this.adminService.editProduct(
      id,
      name,
      desc,
      notedesc,
      detaildesc,
      paymentdesc,
      warrantydesc,
      sku,
      category_id,
      algorithm_id,
      price,
      productImage,
      pricepromotion,
      quantity, flag, hps, weight, shippinginfo
    )
      .pipe(take(1), catchError(
        error => {
          this.FormExceptionOccurEv.emit(error);
          return throwError(error);
        }
      ))
      .subscribe(() => {
        this.FormSubmittedEv.emit(true);
        this.notifierService.notify('success', 'Sửa sản phẩm thành công!');
        this.activeModal.close('Close click');
    });
  }

  getAlgorithmList() {
    this.adminService.getAlgorithmList(-1)
      .pipe(take(1), catchError(
        error => {
          return throwError(error);
        }
      ))
      .subscribe(data => {
        this.algorithmList = data;
    });
  }

  removeItemPhoto(value: number) {
    this.productimages = this.productimages.filter((data) => data !== this.productimages[value]);
    if (this.currentNode === value) {
      if (value >= 1) {
        this.currentNode = this.currentNode - 1;
      }
    } else if (value < this.currentNode) {
      this.currentNode = this.currentNode - 1;
    }
  }

  toggleActive() {
    this.adminService.toggleActive(this.initialState.id)
      .pipe(take(1), catchError(
        error => {
          return throwError(error);
        }
      ))
      .subscribe(() => {
        this.FormSubmittedEv.emit(true);
        this.notifierService.notify('success', this.initialState.isActive ? 'Vô hiệu hóa sản phẩm thành công' : 'Kích hoạt sản phẩm thành công');
        this.onUserClickClose();
    });
  }

  processFile(imageInput: any) {
    const file: File = imageInput.files[0];
    const reader = new FileReader();
    this.isUploading = true;

    reader.addEventListener('load', (event: any) => {
      this.selectedFile = new ImageSnippet(event.target.result, file);
      const base64 = /,(.+)/.exec(event.target.result)[1];

      this.imageService.uploadImage(base64, file.name).subscribe(
        (res) => {
          this.currentBinaryFile = res.file_name + '' + res.type;
          this.fileName = file.name;
          this.isUploading = false;
          this.notifierService.notify('success', 'Tải lên thành công!');
          this.productimages.push({
            imageUrl: 'https://cdn.notevn.com/' + res.file_name + '' + res.type,
            alt_Name: file.name
          });
        },
        (err) => {
          this.currentBinaryFile = null;
          this.isUploading = false;
          this.notifierService.notify('error', 'Tải lên thất bại!');
        }
      );
    });

    reader.readAsDataURL(file);
  }

  onUserClickClose() {
    this.FormCloseEv.emit(true);
    this.activeModal.close('Close click');
  }

}
