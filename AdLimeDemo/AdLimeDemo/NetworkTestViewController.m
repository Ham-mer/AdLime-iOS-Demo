//
//  NetworkTestViewController.m
//  TaurusAds_iOS_TestApp
//
//  Created by Hammer on 2019/7/10.
//  Copyright © 2019 we. All rights reserved.
//

#import "NetworkTestViewController.h"
#import "Masonry.h"
#import "AdTypeViewController.h"
#import "macro.h"


@interface NetworkTestViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *netWorksDic;
@property (nonatomic, strong) NSArray *sortedArray;
@property (nonatomic, strong) NSMutableArray *adsArr;
@end

@implementation NetworkTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    _netWorksDic = @{@"AdColony": @[@"d54e608b-e2d7-44ae-aa88-9515d6f8ea9d", @"", @"bbbffc33-7840-42e4-ab7f-68318385d371",
                   @"", @"cb9e32b5-d21b-443e-a70b-3fd6015e1671"],
    @"Admob": @[@"4c237306-12c5-4630-8abf-21f81013e4a9", @"e1c9202a-490c-4a82-badc-b996be3e9958", @"678a54de-746e-488a-b866-dac81d4eef89", @"f0d18ed5-1d72-4d3e-ba7e-87fec9081cd4", @"ff519879-da39-4223-86aa-e31592f26f09"],
    @"AdGeneration": @[@"65d10821-059d-49ad-92d0-08097e5139fb", @"cb846d08-124b-4469-89f9-bac25abd8f9d", @"e123cd5a-5c7f-40ba-9ba9-49afb404b2a8", @"d1130de7-e972-49b3-8395-2f2f868ae63c", @""],
    @"Amazon": @[@"6d258892-8436-47cb-829f-08be71ce31c6", @"2ecda899-0b1c-424c-a373-2cf15704d3bf", @"5c860bb3-9952-4ffd-89de-c8f4845736cf", @"", @""],
    @"AppLovin": @[@"a6c9ecea-fee1-421c-9b8a-4e674e5e4d93", @"a56dd5ae-e02c-4888-92bb-1e84906998a2", @"8404f9d7-5a95-4ac2-88cf-7c7965f328a0", @"660053f8-e3e6-4643-b887-9a2341eddd0b", @"1deae870-5aee-4423-b535-4e38e7ffbeb6"],
    @"Chartboost": @[@"b667c1c4-d2fd-413e-a0be-214bdb78fc43", @"", @"dcf40d6e-af32-4710-a808-1083d1125384", @"", @"d81961ef-9c56-4d0c-a8b7-40ec9da79219"],
    @"Criteo": @[@"f69148b6-6bfe-47db-9bad-c7373b43ede7", @"", @"daf02613-7250-4382-842c-d88a15a776e8", @"", @""],
    @"DFP": @[@"f1c0f8ae-ae0a-4cc0-99e9-59c9d58e6d28", @"176f681f-1c7a-4a4b-af87-aa96897817fd", @"a2bd034b-ac9e-4c5c-a067-ab53ffd97e11", @"0e00d15a-961c-490b-ba57-ce6fa85573af", @"02a7ed95-b3c2-48d9-aa8d-3890d57c4f2c"],
    @"DisplayIO": @[@"", @"887e7451-370b-4803-93c1-e419071a208b", @"489a37c7-4075-4dce-a3dd-10b754966a37", @"", @"fb0364fc-1072-4e30-abdf-8991ef86a5ee"],
    @"DU AD Platform": @[@"953906c1-862a-429d-925a-c6c5cc794a5f", @"", @"f92574ad-85c2-47b0-902d-4be949d8e71e", @"2dc28770-a7c8-42b4-bbba-cc82adcd49e8", @""],
    @"Facebook": @[@"25029c20-873b-42c2-a4e9-51bd81da663c", @"8f90397e-9882-4af4-8e32-1e6319e9f3be", @"44ef6305-0262-46cd-891a-0364a0057643", @"12da2ed4-75b4-4861-b52f-86a7c1e74927", @"a0a73c47-9194-4351-8322-460c9d29f5da"],
    @"Five": @[@"", @"7ebe3b57-7b4f-42ff-aa31-5e7ac6696295", @"b628489f-6f1c-4b4c-9ada-7d1d89418fe1", @"", @"71bd5399-23b0-41e7-8327-cfcf773db410"],
    @"Flurry": @[@"de69e1d0-4382-484a-bfe3-6937f44dc1d9", @"", @"f6356310-64dd-430c-93ec-49fc9fe75321", @"430c4b28-5908-4177-8e01-84caa255d687", @"e895a41a-5245-4357-8a27-fcc6f4c9868f"],
    @"Fyber": @[@"365f6f63-9b57-4379-a930-1fa8479d1781", @"1bfc10aa-0d67-4da2-89e7-acc288e81998", @"dbf26e30-6cf0-4ada-b6d5-65aa0a53fb0b", @"", @"71f3d9b4-143d-4f96-8223-dda0d11d4362"],
    @"IronSource": @[@"54b72118-930e-4d47-a326-d3d57464f6e6", @"1337e3e0-23e9-4849-983b-a4260956d21b", @"f0113d3e-bb88-4d08-9ae6-9a8f638a5600", @"", @"d5f80412-e716-4a12-80f6-1c5eff9140e7"],
    @"Maio": @[@"", @"", @"99617581-85cf-4f65-8c46-c4470dd20bc2", @"", @"25e2bebf-a692-4228-803e-82038b56261a"],
    @"Marketplace": @[@"3096cc39-a134-4ff9-b491-c67466ffceba", @"fdd71ced-2afe-473d-8822-1b7dadee0ac9", @"b2daff4e-331a-4ef3-b035-f116dfe7639f", @"4cec5591-3327-45bc-983c-9a52365af609", @"0af81fd9-2482-4b09-9f2a-ee4cc84ed325"],
    @"Mopub": @[@"4f7560dc-58c7-433b-a227-7b61aea3d7ae", @"83914041-0f00-480a-ac76-c574e9be2ab3", @"94bcc9c9-ca60-4a06-a84d-e9c893a0b933", @"10329cb4-6676-4a69-b20c-48736a953dbf", @"7aba7997-967f-4d83-b7c4-dec97bf684cf"],
    @"Nend": @[@"e1024c92-bf41-4892-a7f1-9971b675181b", @"e41bda79-c924-42f9-89d4-21bfefccf261", @"ef9c77ea-2fa3-4efe-a107-52e771648e5c", @"f0accbea-1961-4a72-8962-5fcc91609637", @"79108573-598c-42bc-808b-8569a2cada72"],
    @"Tapjoy":@[@"", @"", @"dacdf765-61e7-4f3b-b21c-c1ec0d81fef2", @"", @"bf9e8efe-eda0-4ec4-9f7f-8543062d9d7e"],
    @"Tiktok":@[@"c1b67204-f1af-437e-a53f-4ce342c32a48", @"f7682d60-84b7-44a6-86f0-da73ece47427", @"66123f13-5a77-4cee-ab21-3bfd27d8b84d", @"b3162881-30e7-4526-99f3-956f45167eb3", @"1f1a5107-b710-4969-bb8a-f306a7fcf2b4"],
    @"Unity Ads": @[@"60769db1-6d78-4d92-9875-44cea0d75bdc", @"", @"f6122590-1b63-4255-b2f6-537282877009", @"", @"c3c312ba-992e-49e2-9d56-f5cab030e550"],
    @"Vungle": @[@"", @"8a9ecfba-6e7c-4ce2-bdda-18fdd0e518ea", @"af65d340-1ae2-4f57-90cf-bf723bb78a34", @"5b8ab434-b499-4ba0-bb36-4706b281fe09", @"c6a9d2cd-aa6f-4125-9d5e-6ecbb04e6fbc"]
    };
    
    NSArray *keyArray = [_netWorksDic allKeys];
        
   _sortedArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2) {
            return[obj1 compare:obj2 options:NSNumericSearch];
    }];
    
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:header];
    [header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kTopBarSafeHeight);
        make.bottom.equalTo(self.view.mas_top).offset(kTopBarSafeHeight+20);
    }];
    
    UILabel *titleLab =  [[UILabel alloc]init];
    titleLab.text = @"Network Test";
    [titleLab setTextAlignment:NSTextAlignmentCenter];
    [header addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(header);
        make.width.equalTo(@(250));
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [header addSubview:backBtn];
    
    [backBtn addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(header).offset(-20);
        make.centerY.equalTo(header);
        make.width.equalTo(@(50));
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(header.mas_bottom).offset(1);
        make.height.equalTo(@1);
    }];
    
    UITableView *networksTab = [[UITableView alloc] init];
    networksTab.delegate = self;
    networksTab.dataSource = self;
    networksTab.userInteractionEnabled = YES;
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [networksTab setTableFooterView:view];
 
    
    [self.view addSubview:networksTab];
    
    [networksTab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_bottom).offset(2);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (void) gotoBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark <UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _netWorksDic.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"networkCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    cell.textLabel.text = _sortedArray[indexPath.row];
    [cell.textLabel setTextColor:[UIColor colorWithRed:28.0/255.0 green:147.0/255.0 blue:243.0/255.0 alpha:1.0]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AdTypeViewController *adsTestVc = [[AdTypeViewController alloc] init];
    adsTestVc.modalPresentationStyle = UIModalPresentationFullScreen;
    NSString *key = _sortedArray[indexPath.row];
    adsTestVc.titleStr =  key;
    NSArray *ads = _netWorksDic[key];
    NSMutableArray *adTypes =  [NSMutableArray new];
    if (![ads[0] isEqualToString:@""]) {
        [adTypes addObject: @[@"Banner", ads[0]]];
    }
    
    if (![ads[1] isEqualToString:@""]) {
        [adTypes addObject: @[@"Banner_300*250", ads[1]]];
    }
    
    if (![ads[2] isEqualToString:@""]) {
        [adTypes addObject: @[@"Interstitial", ads[2]]];
    }
    
    if (![ads[3] isEqualToString:@""]) {
        [adTypes addObject: @[@"Native", ads[3]]];
    }
    
    if (![ads[4] isEqualToString:@""]) {
        [adTypes addObject: @[@"RewardedVideo", ads[4]]];
    }
    adsTestVc.adsDic = [NSArray arrayWithArray:adTypes];
    
    [self presentViewController:adsTestVc animated:YES completion:nil];
}

@end
