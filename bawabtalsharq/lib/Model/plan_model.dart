class PlanModel {
  int code;
  String status;
  String msg;
  List<Plan> plan;

  PlanModel({this.code, this.status, this.msg, this.plan});

  PlanModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      plan = new List<Plan>();
      json['data'].forEach((v) {
        plan.add(new Plan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.plan != null) {
      data['data'] = this.plan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plan {
  String packageId;
  String packageName;
  String packagePrice;
  String postProducts;
  String mainCategory;
  String superiorSuplayer;
  String adminAccount;
  String minisiteCreation;
  String requestForQuotation;
  String recommendationProducts;
  String productReport;
  String exportManager;
  String accountManager;
  String websiteAds;
  String mobileAppAds;
  String liveChat;
  String videoChat;
  String audioChat;
  String socialMediaCampagin;
  String hostingAndCreationWebsite;
  String officialEmail;
  String onlineSupport;
  String onlandVerification;

  Plan(
      {this.packageId,
      this.packageName,
      this.packagePrice,
      this.postProducts,
      this.mainCategory,
      this.superiorSuplayer,
      this.adminAccount,
      this.minisiteCreation,
      this.requestForQuotation,
      this.recommendationProducts,
      this.productReport,
      this.exportManager,
      this.accountManager,
      this.websiteAds,
      this.mobileAppAds,
      this.liveChat,
      this.videoChat,
      this.audioChat,
      this.socialMediaCampagin,
      this.hostingAndCreationWebsite,
      this.officialEmail,
      this.onlineSupport,
      this.onlandVerification});

  Plan.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    packagePrice = json['package_price'];
    postProducts = json['Post_products'];
    mainCategory = json['Main_Category'];
    superiorSuplayer = json['Superior_Suplayer'];
    adminAccount = json['Admin_Account'];
    minisiteCreation = json['Minisite_Creation'];
    requestForQuotation = json['Request_For_Quotation'];
    recommendationProducts = json['Recommendation_Products'];
    productReport = json['Product_Report'];
    exportManager = json['Export_Manager'];
    accountManager = json['Account_Manager'];
    websiteAds = json['Website_Ads'];
    mobileAppAds = json['Mobile_App_Ads'];
    liveChat = json['Live_Chat'];
    videoChat = json['Video_Chat'];
    audioChat = json['Audio_Chat'];
    socialMediaCampagin = json['Social_Media_Campagin'];
    hostingAndCreationWebsite = json['Hosting_and_Creation_Website'];
    officialEmail = json['Official_Email'];
    onlineSupport = json['Online_support'];
    onlandVerification = json['Onland_Verification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['package_name'] = this.packageName;
    data['package_price'] = this.packagePrice;
    data['Post_products'] = this.postProducts;
    data['Main_Category'] = this.mainCategory;
    data['Superior_Suplayer'] = this.superiorSuplayer;
    data['Admin_Account'] = this.adminAccount;
    data['Minisite_Creation'] = this.minisiteCreation;
    data['Request_For_Quotation'] = this.requestForQuotation;
    data['Recommendation_Products'] = this.recommendationProducts;
    data['Product_Report'] = this.productReport;
    data['Export_Manager'] = this.exportManager;
    data['Account_Manager'] = this.accountManager;
    data['Website_Ads'] = this.websiteAds;
    data['Mobile_App_Ads'] = this.mobileAppAds;
    data['Live_Chat'] = this.liveChat;
    data['Video_Chat'] = this.videoChat;
    data['Audio_Chat'] = this.audioChat;
    data['Social_Media_Campagin'] = this.socialMediaCampagin;
    data['Hosting_and_Creation_Website'] = this.hostingAndCreationWebsite;
    data['Official_Email'] = this.officialEmail;
    data['Online_support'] = this.onlineSupport;
    data['Onland_Verification'] = this.onlandVerification;
    return data;
  }
}
