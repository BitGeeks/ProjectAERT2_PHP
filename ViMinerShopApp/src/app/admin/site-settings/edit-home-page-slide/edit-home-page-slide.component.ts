import { Component, EventEmitter, HostListener, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { NotifierService } from 'angular-notifier';
import { throwError } from 'rxjs';
import { take, catchError } from 'rxjs/operators';
import { AdminService } from 'src/app/services/admin.service';
import { ImageService } from 'src/app/services/image-service.service';
import { ImageSnippet } from 'src/app/store/ImageSnippet';

@Component({
  selector: 'app-edit-home-page-slide',
  templateUrl: './edit-home-page-slide.component.html',
  styleUrls: ['./edit-home-page-slide.component.scss']
})
export class EditHomePageSlideComponent implements OnInit {
  editHomepageSlide: FormGroup;

  selectedFile: ImageSnippet;
  dragAreaClass: string;

  isUploading = false;
  imageurl = false;

  @Input()
  public initialState: { [key: string]: any };

  @Output()
  public FormSubmittedEv = new EventEmitter<boolean>();

  @Output()
  public FormExceptionOccurEv = new EventEmitter<string>();

  @Output()
  public FormCloseEv = new EventEmitter<boolean>();

  constructor(
    private imageService: ImageService,
    private notifierService: NotifierService,
    public activeModal: NgbActiveModal,
    private adminService: AdminService
  ) { }

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

  ngOnInit(): void {
    this.editHomepageSlide = new FormGroup({
      id: new FormControl(null, [Validators.required]),
      name: new FormControl(null, [Validators.required]),
      fillcolor: new FormControl(null, [Validators.required]),
      imgurl: new FormControl(null, [Validators.required]),
      jumpto: new FormControl(null, [Validators.required])
    });
    this.editHomepageSlide.patchValue({
      id: this.initialState.id,
      name: this.initialState.name,
      fillcolor: this.initialState.fillcolor,
      imgurl: this.initialState.imgurl,
      jumpto: this.initialState.jumpto
    });
    this.imageurl = this.initialState.imgurl !== null;
  }

  onEditSubmitted() {
    if (!this.editHomepageSlide.valid) { return; }
    const { id, name, fillcolor, imgurl, jumpto } = this.editHomepageSlide.value;
    this.adminService.editSlideImage(id, name, fillcolor, imgurl, jumpto)
      .pipe(take(1), catchError(
        error => {
          this.FormExceptionOccurEv.emit(error);
          return throwError(error);
        }
      ))
      .subscribe(() => {
        this.notifierService.notify('success', 'Sửa slide thành công');
        this.FormSubmittedEv.emit(true);
        this.activeModal.close('Close click');
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
          this.isUploading = false;
          this.notifierService.notify('success', 'Tải lên thành công!');
          this.editHomepageSlide.patchValue({
            imgurl: 'https://cdn.notevn.com/' + res.file_name + '' + res.type
          });
          this.imageurl = true;
        },
        (err) => {
          this.isUploading = false;
          this.notifierService.notify('error', 'Tải lên thất bại!');
          this.imageurl = false;
        }
      );
    });

    reader.readAsDataURL(file);
  }

  onAdminClickRemoveImage() {
    this.imageurl = false;
  }

  onUserClickClose() {
    this.FormCloseEv.emit(true);
    this.activeModal.close('Close click');
  }

}
