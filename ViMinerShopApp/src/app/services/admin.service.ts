import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { config } from '../../config/local';
import { AdminDashboardData, Algorithm, Orders, PaymentDetail, processImage, ProductCategory, ProductDetail, productinventory, Repair, RepairOrder, RepairSite, RoleVar, ShippingMethod, SlideImage, User } from '../store/model';

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  url = `${config.apiUrl}/api/admin`;
  defaultSize = 10;

  constructor(
    private httpClient: HttpClient
  ) { }

  getInventoryList(paginate: number) {
    let params = new HttpParams();
    if (paginate !== -1)
    {
      params = params.set('page', paginate.toString());
      params = params.set('size', this.defaultSize.toString());
    }

    return this.httpClient.get<Array<productinventory>>(`${this.url}/inventories/list`, {
      params
    });
  }

  getAlgorithmList(paginate: number) {
    let params = new HttpParams();
    if (paginate !== -1)
    {
      params = params.set('page', paginate.toString());
      params = params.set('size', this.defaultSize.toString());
    }

    return this.httpClient.get<Array<Algorithm>>(`${this.url}/algorithms/list`, {
      params
    });
  }

  getAllAlgorithmCount() {
    return this.httpClient.get<number>(`${this.url}/algorithms/count`);
  }

  addProduct(
    name: string,
    desc: string,
    notedesc: string,
    detaildesc: string,
    paymentdesc: string,
    warrantydesc: string,
    sku: string,
    category_id: number,
    algorithm_id: number,
    price: number,
    productImage: Array<processImage>,
    pricepromotion: number, quantity: number, flag: string, hps: number, weight: number, shippinginfo: string
  ) {
    return this.httpClient.post<ProductDetail>(`${this.url}/products/add`, {
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
    });
  }

  editProduct(id: number, name: string, desc: string, notedesc: string, detaildesc: string, paymentdesc: string, warrantydesc: string, sku: string, category_id: number, algorithm_id: number, price: number, productImage: Array<processImage>, pricepromotion: number, quantity: number, flag: string, hps: number, weight: number, shippinginfo: string) {
    return this.httpClient.post<ProductDetail>(`${this.url}/products/edit/${id}`, {
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
    });
  }

  addInventory(quantity: number, flag: string, hps: number, weight: number, shippinginfo: string) {
    return this.httpClient.post<productinventory>(`${this.url}/inventories/add`, {
      quantity, flag, hps, weight, shippinginfo
    });
  }

  updateInventory(id: number, quantity: number, flag: string, hps: number, weight: number, shippinginfo: string) {
    return this.httpClient.post<productinventory>(`${this.url}/inventories/edit/${id}`, {
      quantity, flag, hps, weight, shippinginfo
    });
  }

  addCategory(name: string, desc: string, image: string, slug: string) {
    return this.httpClient.post<ProductCategory>(`${this.url}/categories/add`, {
      name, desc, image, slug
    });
  }

  updateCategory(id: number, name: string, desc: string, image: string, slug: string) {
    return this.httpClient.post<ProductCategory>(`${this.url}/categories/edit/${id}`, {
      name, desc, image, slug
    });
  }

  addAlgorithm(name: string, desc: string, slug: string) {
    return this.httpClient.post<Algorithm>(`${this.url}/algorithms/add`, {
      name, desc, slug
    });
  }

  editAlgorithm(id, name, desc, slug) {
    return this.httpClient.post<Algorithm>(`${this.url}/algorithms/edit/${id}`, {
      name, desc, slug
    });
  }

  getAllRepairCount() {
    return this.httpClient.get<number>(`${this.url}/repairs/count`, {});
  }

  getRepairList(page: number) {
    let params = new HttpParams();
    if (page !== -1) {
      params = params.set('page', page.toString());
      params = params.set('size', this.defaultSize.toString());
    }

    return this.httpClient.get<Array<Repair>>(`${this.url}/repairs/list`, {
      params
    });
  }

  getRepairListByType(page: number, type: number) {
    let params = new HttpParams();
    if (page !== -1) {
      params = params.set('page', page.toString());
      params = params.set('size', this.defaultSize.toString());
    }

    return this.httpClient.get<Array<Repair>>(`${this.url}/repairs/type/${type}`, {
      params
    });
  }

  addShippingMethod(name: string, shortname: string, repairflag: number, salesflag: number, supportfreeship: number, erpcode: string, logourl: string, avgfeeperkm: number) {
    return this.httpClient.post<ShippingMethod>(`${this.url}/shipping/add`, {
      name, shortname, repairflag, salesflag, supportfreeship, erpcode, logourl, avgfeeperkm
    });
  }

  editShippingMethod(id: number, name: string, shortname: string, repairflag: number, salesflag: number, supportfreeship: number, erpcode: string, logourl: string, avgfeeperkm: number) {
    return this.httpClient.post<ShippingMethod>(`${this.url}/shipping/edit/${id}`, {
      name, shortname, repairflag, salesflag, supportfreeship, erpcode, logourl, avgfeeperkm
    });
  }

  getAllOrders(page: number, type: number) {
    let params = new HttpParams();
    params = params.set('page', page.toString());
    params = params.set('size', this.defaultSize.toString());
    return this.httpClient.get<Array<Orders>>(`${this.url}/orders/${type}`, {
      params
    });
  }

  getAllRepairSiteCount() {
    return this.httpClient.get<number>(`${this.url}/repairsites/count`);
  }

  addRepairSite(code, name, extrainfo, note, location) {
    return this.httpClient.post<RepairSite>(`${this.url}/repairsites/add`, {
      code, name, extrainfo, note, location
    });
  }

  getRepairSiteList(paginate: number) {
    let params = new HttpParams();
    if (paginate !== -1)
    {
      params = params.set('page', paginate.toString());
      params = params.set('size', this.defaultSize.toString());
    }

    return this.httpClient.get<Array<RepairSite>>(`${this.url}/repairsites/list`, {
      params
    });
  }

  editRepairSite(code, name, extrainfo, note, location) {
    return this.httpClient.post<RepairSite>(`${this.url}/repairsites/edit/${code}`, {
      code, name, extrainfo, note, location
    });
  }

  onAdminChangeOrderStatus(id: number, status: number) {
    return this.httpClient.post<Array<Orders>>(`${this.url}/orders/edit/${id}`, {
      status
    });
  }

  editTicketStatus(id: number, status: number) {
    return this.httpClient.post<Repair>(`${this.url}/repairs/edit/${id}`, {
      status
    });
  }

  editRepairOrderStatus(id: number, repairOrderStatus: number, price: number) {
    return this.httpClient.post<RepairOrder>(`${this.url}/repairorder/update/${id}`, {
      repairOrderStatus,
      price
    });
  }

  removeProductImage(ProductID: number, ImageUrl: string) {
    return this.httpClient.post(`${this.url}/productimage/remove`, {
      ProductID,
      ImageUrl
    });
  }

  getUserList(paginate: number) {
    let params = new HttpParams();
    if (paginate !== -1)
    {
      params = params.set('page', paginate.toString());
      params = params.set('size', this.defaultSize.toString());
    }

    return this.httpClient.get<Array<User>>(`${this.url}/users/list`, {
      params
    });
  }

  getAllUserCount() {
    return this.httpClient.get<number>(`${this.url}/users/count`, {});
  }

  setUserPermission(id: number, role_id: number) {
    return this.httpClient.post(`${this.url}/users/editPermission/${id}`, {
      role_id
    });
  }

  getRoleList() {
    return this.httpClient.get<Array<RoleVar>>(`${this.url}/roles/list`, {});
  }

  getSlideImages() {
    return this.httpClient.get<Array<SlideImage>>(`${this.url}/homeslide/all`, {});
  }

  removeSlideImages(id: number) {
    return this.httpClient.post<Array<SlideImage>>(`${this.url}/homeslide/remove/${id}`, {});
  }

  addNewSlideImage(name: string, fillcolor: string, imgurl: string, jumpto: string) {
    return this.httpClient.post<Array<SlideImage>>(`${this.url}/homeslide/add`, {
      name,
      fillcolor,
      imgurl,
      jumpto
    });
  }

  editSlideImage(id: number, name: string, fillcolor: string, imgurl: string, jumpto: string) {
    return this.httpClient.post<Array<SlideImage>>(`${this.url}/homeslide/edit/${id}`, {
      name,
      fillcolor,
      imgurl,
      jumpto
    });
  }

  setHPNotice(notify1: string, notify2: string, notify3: string) {
    return this.httpClient.post(`${this.url}/3notify/edit`, {
      notify1,
      notify2,
      notify3
    });
  }

  getAllTransactionList(page: number) {
    let params = new HttpParams();
    if (page !== -1) {
      params = params.set('page', page.toString());
      params = params.set('size', this.defaultSize.toString());
    }

    return this.httpClient.get<Array<PaymentDetail>>(`${this.url}/transaction/list`, {
      params
    });
  }

  getAllTransactionCount() {
    return this.httpClient.get<number>(`${this.url}/transaction/count`, {});
  }

  getPageSize = () => this.defaultSize;

  getOrderHistory() {
    return this.httpClient.get<AdminDashboardData>(`${this.url}/orders/chart`, {});
  }

  toggleActive(id: number) {
    return this.httpClient.post(`${this.url}/products/toggleActive/${id}`, {});
  }
  
  toggleRepairSiteActive(code: string) {
    return this.httpClient.post(`${this.url}/repairsites/toggleActive/${code}`, {});
  }

  getAllProductCount() {
    return this.httpClient.get<number>(`${this.url}/products/count`, {});
  }

  getAllProducts(page: number) {
    let params = new HttpParams();
    params = params.set('page', page.toString());
    params = params.set('size', this.defaultSize.toString());

    return this.httpClient.get<Array<ProductDetail>>(`${this.url}/products/all`, {
      params
    });
  }

  getAllOrderCount(type: number) {
    return this.httpClient.get<number>(`${this.url}/orders/count/${type}`, {});
  }

  getAllShippingMethodsCount() {
    return this.httpClient.get<number>(`${this.url}/shippingmethods/count`, {});
  }

  getAllShippingMethods(page: number) {
    let params = new HttpParams();
    params = params.set('page', page.toString());
    params = params.set('size', this.defaultSize.toString());

    return this.httpClient.get<Array<ShippingMethod>>(`${this.url}/shippingmethods/list`, {
      params
    });
  }
}
