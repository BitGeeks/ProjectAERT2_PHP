import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { throwError } from 'rxjs';
import { take, catchError } from 'rxjs/operators';
import { AdminService } from 'src/app/services/admin.service';
import { NotifierService } from 'angular-notifier';

@Component({
  selector: 'app-edit-repair-site',
  templateUrl: './edit-repair-site.component.html',
  styleUrls: ['./edit-repair-site.component.scss']
})
export class EditRepairSiteComponent implements OnInit {
  editRepairSite: FormGroup;

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
	private notifierService: NotifierService
  ) { }

  ngOnInit(): void {
    this.editRepairSite = new FormGroup({
      code: new FormControl(null, [Validators.required]),
      name: new FormControl(null, [Validators.required]),
      extrainfo: new FormControl(null, []),
      note: new FormControl(null, []),
      location: new FormControl(null, [Validators.required])
    });
    this.editRepairSite.patchValue({
      code: this.initialState.code,
      name: this.initialState.name,
      extrainfo: this.initialState.extrainfo,
      note: this.initialState.note,
      location: this.initialState.location
    });
  }

  onEditSubmitted() {
    if (!this.editRepairSite.valid) { return; }
    const { code, name, extrainfo, note, location } = this.editRepairSite.value;
    this.adminService.editRepairSite(code, name, extrainfo, note, location)
      .pipe(take(1), catchError(
        error => {
          this.FormExceptionOccurEv.emit(error);
          return throwError(error);
        }
      ))
      .subscribe(data => {
        this.FormSubmittedEv.emit(true);
		this.notifierService.notify('success', 'S???a ?????i l?? s???a ch???a th??nh c??ng!');
		this.onUserClickClose();
    });
  }

  onUserClickClose() {
    this.FormCloseEv.emit(true);
    this.activeModal.close('Close click');
  }

  toggleActive() {
    this.adminService.toggleRepairSiteActive(this.initialState.code)
      .pipe(take(1), catchError(
        error => {
          return throwError(error);
        }
      ))
      .subscribe(() => {
        this.FormSubmittedEv.emit(true);
        this.notifierService.notify('success', !this.initialState.isDisabled ? 'V?? hi???u h??a ?????i l?? s???a ch???a th??nh c??ng' : 'K??ch ho???t ?????i l?? s???a ch???a th??nh c??ng');
        this.onUserClickClose();
    });
  }
}
