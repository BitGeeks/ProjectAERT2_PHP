import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { NotifierService } from 'angular-notifier';
import { throwError } from 'rxjs';
import { take, catchError } from 'rxjs/operators';
import { AccountService } from 'src/app/services/account.service';
import { AdminService } from 'src/app/services/admin.service';
import { OrderService } from 'src/app/services/order.service';
import { PaymentProvider, ShippingMethod } from 'src/app/store/model';

@Component({
  selector: 'app-edit-order-status-dialog',
  templateUrl: './edit-order-status-dialog.component.html',
  styleUrls: ['./edit-order-status-dialog.component.scss']
})
export class EditOrderStatusDialogComponent implements OnInit {
  editOrderStatus: FormGroup;

  shippingMethods: Array<ShippingMethod>;
  paymentProviderList: Array<PaymentProvider>;

  @Input()
  public initialState: { [key: string]: any };

  @Output()
  public FormSubmittedEv = new EventEmitter<boolean>();

  @Output()
  public FormExceptionOccurEv = new EventEmitter<string>();

  @Output()
  public FormCloseEv = new EventEmitter<boolean>();

  constructor(
    public activeModal: NgbActiveModal,
    private adminService: AdminService,
    private notifierService: NotifierService,
    private accountService: AccountService,
    private orderService: OrderService
    ) { }

  ngOnInit(): void {
    this.editOrderStatus = new FormGroup({
      id: new FormControl(null, [Validators.required]),
      orderStatus: new FormControl(null, [Validators.required])
    });
    this.editOrderStatus.patchValue({
      id: this.initialState.id,
      orderStatus: this.initialState.paymentdetail.status.toString()
    });
    this.getShippingMethods();
    this.getPaymentMethod();
  }

  onEditSubmitted() {
    if (!this.editOrderStatus.valid) { return; }
    const { id, orderStatus } = this.editOrderStatus.value;
    this.adminService.onAdminChangeOrderStatus(id, orderStatus)
    .pipe(take(1), catchError(
      error => {
        this.FormExceptionOccurEv.emit(error);
        return throwError(error);
      }
    ))
    .subscribe(data => {
      this.FormSubmittedEv.emit(true);
      this.notifierService.notify('success', 'C???p nh???t tr???ng th??i ????n h??ng th??nh c??ng!');
      this.activeModal.close('Close click');
  });
  }

  onUserClickClose() {
    this.FormCloseEv.emit(true);
    this.activeModal.close('Close click');
  }

  renderShippingUnit(unitId: number) {
    if (typeof this.shippingMethods !== 'undefined' && this.shippingMethods.length !== 0) {
      return this.shippingMethods.filter(data => data.id === unitId)[0];
    }
    return {
      shortname: 'Ch??a x??c ?????nh',
      name: 'Ch??a x??c ?????nh'
    };
  }

  renderPaymentProvider(providerId: number) {
    if (providerId !== 0 && typeof this.paymentProviderList !== 'undefined' && this.paymentProviderList.length !== 0) {
      return this.paymentProviderList.filter(data => data.id === providerId)[0];
    }
    return {
      name: 'Ch??a x??c ?????nh'
    };
  }

  renderOrderStatus(type: number) {
    switch (type) {
      case 0:
        return 'Ch??a thanh to??n';
      case 1:
        return '??ang ch???';
      case 2:
        return 'Ch??a giao';
      case 3:
        return '??ang giao';
      case 4:
        return '???? giao';
      default:
        return 'H???t h???n';
    }
  }

  getShippingMethods() {
    this.accountService.getShippingMethods()
      .pipe(take(1), catchError(
        error => {
          this.notifierService.notify('error', 'C?? l???i x???y ra trong qu?? tr??nh thao t??c! Vui l??ng th??? l??m m???i trang');
          return throwError(error);
        }
      ))
      .subscribe(data => {
        this.shippingMethods = data;
    });
  }

  getPaymentMethod() {
    this.orderService.getPaymentProvider().pipe(take(1), catchError(
      error => {
        this.notifierService.notify('error', 'C?? l???i x???y ra trong qu?? tr??nh thao t??c! Vui l??ng th??? l??m m???i trang');
        return throwError(error);
      }
    )).subscribe((resp: Array<PaymentProvider>) => {
      this.paymentProviderList = resp;
    });
  }

}
