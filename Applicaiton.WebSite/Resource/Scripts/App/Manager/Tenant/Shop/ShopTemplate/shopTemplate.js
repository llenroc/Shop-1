function Control(data) {
    var self = this;
    this.id =data?data.id: Guid.NewGuid.toString();
    this.name = null;
    this.marginBottom = data?data.marginBottom:false;
}

function RichTextControl(data){
    Control.call(this, data);
    this.name = 'RichTextControl';
    this.content =data?data.content: null;
}
RichTextControl.title =app.localize( 'RichTextControl');

function PictureAdControl(data) {
    Control.call(this, data);
    this.name = 'PictureAdControl';
    this.path = data ? data.path : "/Content/Images/pictureAd.jpg";
}
PictureAdControl.title =app.localize( 'PictureAdControl');
function NavControl(data) {
    Control.call(this, data);
    this.name = 'NavControl';
    this.items = data?data.items:[];
}
NavControl.prototype = new Control();
NavControl.prototype.removeItem = function (index) {
    this.items.splice(index, 1);
};
NavControl.prototype.addItem = function () {
    var item = {
        icon: "/Content/frame/canknow/image/upload-picture.png",
        name: "Name",
        url:null
    };
    this.items.push(item);
};
NavControl.title = app.localize( 'NavControl');

function SliderControl(data) {
    Control.call(this, data);
    this.name = 'SliderControl';
    this.items =data?data.items: [];
}
SliderControl.prototype = new Control();
SliderControl.prototype.removeItem = function (index) {
    this.items.splice(index, 1);
};
SliderControl.prototype.addItem = function () {
    var item = {
        picture: "/Content/frame/canknow/image/upload-picture.png",
        url: null
    };
    this.items.push(item);
};
SliderControl.title = app.localize('SliderControl');

var productListStyleOptions = [
    { title: app.localize("Grid"), value: 1 },
    { title: app.localize("List"), value: 2 }];

function ProductListControl(data) {
    Control.call(this, data);
    this.name = 'ProductListControl';
    this.maxCount = data ? data.maxCount : 4;
    this.isRecent = data ? data.isRecent : false;
    this.isHot = data ? data.isHot : false;
    this.categoryId = data ? data.categoryId : null;
    this.style = data ? data.style : productListStyleOptions[0].value;
}
ProductListControl.prototype = new Control();
ProductListControl.title = app.localize('ProductListControl');

function ShopwindowControl(data) {
    Control.call(this, data);
    this.name = 'ShopwindowControl';
    this.items = data?data.items:[];

    if (!data) {
        this.addItem();
        this.addItem();
        this.addItem();
    }
}
ShopwindowControl.prototype = new Control();
ShopwindowControl.prototype.addItem = function () {
    var item = {
        cover: "/Content/frame/canknow/image/upload-picture.png",
        url: null,
    };
    this.items.push(item);
};
ShopwindowControl.title = app.localize('ShopwindowControl');