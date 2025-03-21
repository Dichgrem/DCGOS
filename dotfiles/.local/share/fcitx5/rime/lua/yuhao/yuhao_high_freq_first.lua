-- Name: yuhao_high_freq_first.lua
-- 名称: 繁簡極高頻字前置
-- Version: 20240401
-- Author: forFudan 朱宇浩 <dr.yuhao.zhu@outlook.com>
-- Github: https://github.com/forFudan/
-- 版權聲明：
-- 專爲宇浩輸入法製作 <https://shurufa.app>
-- 轉載請保留作者名和出處
-- Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
---------------------------------------
--
-- 介紹:
-- 將候選中的繁簡極高頻字前置
-- 簡體、繁體字頻分别排在前 3000 的漢字，約 4500 個
-- 本腳本可以配合全碼後置功能使用，達到以下目的：當次選非高頻字，不後置出簡的字，以減少對簡碼的記憶負擔。
--
-- Description:
-- Prioritize the most frequent simplified and traditional Chinese characters
--
-- 版本：
-- 20240401: 初版

---------------------------

local str =
"牢肅曉祸奋妮螺休泼冰扳啥街魚碰贯諷女浴姻驗碟妾效程迹贷崇纹咦脏賺簇整趴來妒沸盼腾拱连妨阳镖靜聯长散叔正垂忠櫻育踩持迈滞魂旋噴惠亭練外瓷拙腳捡怕坟窘霽约楓落點毫脱震澄俺弗页薑嚀尴俩擔濁夷憾内龐遲粒橡刀猶矛恐耀鎮翔噗偽抑三堵惫奇厕典汁不嬌耘魁冕售奖遵舅諾遷吧具朗没朝难汤塘娶案怠嘉姐屠捆哲養丐凍尧领沦輪宜觀劇洗煙诏聚便俄栗党導聖段訣库惰江伍绣戰沃沁萄舍棘数閔奥銜係收础鵑当蒸次绅僚扑戶践杜龍俊裔车很哀逃干坠蒼响論胡爵挖迴袖榜朋估蝴篩绿潰球赖選倉脂初怔姑兹需宿粉鍊斷迷苔蔔楣稽誌穴乌陽斌倒飞紫浇门趙忙们繫读类汲繳階艱贺娴虹饭椎戴敘賊迦譜淮橋厲又窯自密滥极吱蔭廈脹傷矯崗淋樱茂晚湯稿調癒全嚣岔勻騙瓜李阮園撤誘淫兴觸洋哄標鑼广炉嘿狸踢卧灣秘闊垃忍頰髅虔鼻友奧爭盛哭续蘋討澆嫂翁廷伏倚瞳湾是霍結並唤琦栋憂盞西戏閃油躲坡棉嘻萍袋蠅迅杖頂煌鳴危蕭棕勋秀月追崩燕衛狹垒询昔璇繽杨铜军畅雍甚队享鈔胀奮甩颱撲想漁檯擾儉真駐区呛漸傍犯忖矩億瓊芸根詢妓頭乱滿鹅壮珍蔣鋼九性饒表我步梵員拐役楊屈窗绩拭崔蹲庭擬级穷冻莺否被濕豪盾叭謀除淨融披蝇炽掌将當击豫範退撼付驶蒜霉状責谁楞默乍滩龜個曰漾号扣打它键鄉巴汽豎洛滯织琳浩聊萝紳购啤参免俠另秃衆到絕瀚倆邏演怀湘硬溃蜀首傭裙嶼胖毁烈汝练椰骏勤诅貨牛件洒邁翘滴火汹藝市项则涕偉雙原稀泉扬慣撫銘幕雁費藩麽載辩脫蓝今坤烘頑拜空立冲歡輝置邵瘾倡瘫闆蝕乖鍾折势毀睹帅迪指吸敞玄煥睿净叶恆歷遼茹痒純天央厂敗壤焚规断这血若诉刊彩浑刁扎兵佣搶僵泌蛻捏祕计溺改振揍掉耐义槽賜敦髓条揮伐摺伶擋完尋骗她疑箏堆霏如踪烏巫欄筋英駱操笛米壳黃裂酷嘱擦喉携蘭探歲亦呢聆錶甜农票蔬削隶桂縣勞攔肿綿斤瞥講命鄙责渊謝逗析集兄杂醫聳仆盡蓦茶寂碍亮士應遙島已赶岳欠膛桃鬥骆嫻祥殊萨汪急臘借悶茜梭兩讥孙譯荣劝促叨晋欽鬧魯濟妄寇顫式唔后彭鑲匣饋狈嘩涂肢藏儒繞部苗理永鵝嘖憐現貪鴉判禀卑详屎拖职澜拓囂范貌予闖磊粗畫头剑撈凝监罚摘须萎肪喪冉姊凉设財蜥療塢研究藥化徐噹覺庸蓄治函控廓襯仇繁交契吓忘瑶續几半幸漆附隆咖鬆遁而漩牵謹傾襪攜犧蒂宮條華厭豐纱早蠢鑑圣盆巾蔚旦澳疚岫浪南钻堪鉛廣惟霄草材礦寺仕鏡忆微喘監洁輿衫劉酬欺黛译剛扭冒诺秦团荒挤肖芭警肤淑够秩證拨聰邊菩于此倪每澤慶堅繪良科輔腐伙垮务牧斩吻格颇戬喂拢機储簽臥雕龙明剿設战墾漂餃塗端緒稱咐见矚著药墜杏定废视镇锤种艰蓬賴假东飢葬袁狗堯诡詞佈嬰相肉语随绍談麓宠黨功越搖谓司盟盜吞賠廠威揽韻沉伤擅館債參兽出贊或瓦赋循皂募抚罗污迎釀严脆航葉鸚考逛笨顿夺娛处罪荆防甦纳僻债拂憤咽访涨慨腫接玉拯经倾唯辑數織奏盤凑佳鉴琉愛誼食偵棚料社害检矢习吟径寞例基辦诛塑吭狂刃診瘤駭逞圖頻桿藉怒瞄嘗虞渦臣侄专翰邦仑網紅丞横遭鸣苍乏臭诵查感咧皆讓呆骇運白脈哈下变胜斬洶贸怪让饰柱矽勺鞘挑聾歧賣腕嫣赐偷座炫划漪奈鋸企燈带仲胸驻鞠諮怡撞钓荡继疆這绷釣嚎垫尝心四晴胧蠶謂話剪隊裴腸娱訓服介验駕贞嚷帽罷歎適夥丁艺娥熙睜异璧壺您望匾国諧拉師挺移吉韦骤樂盈罐狄揭绯嘎京癌腰賀秉仁刹风绰測競彤担杭梧捞掩传丧捅霧寢腥熊执扇衔膽獵抓背冊履杞八谊柳谅尺帕帆娟皇刷败譽发臺黑益綁貝搓机擱曲辱業驢貿竞仰章頗柜骂炎揪阻彙音挠鍛嚼餓弥炸崖逼併好線則但灰瞧霆誉購槪駛波簾夾區覆喫灯炼拋骚車獻衣旅左走愧吼霎兜肫懶變蕩掃室潛軀尽会扯乘呈租嘀一寫乎爲麟共丫孟汇墅長际屏叮幢樁咒繼超容濤醬症頌虽貶跑閣僕朕陛掐萱逮模返吊焦矿妞揉舌炯呀歼吏切诧搭括認皺眾婦嘶甸氛砰虧积路妃违襲褐哑润朽谨推磚脉跳嵌缺岁匈绽喝限掘瘧尼爬型起簷播剔篤鴿透扶塔溪赢毯倩创補枉環曾苛尹阔肥虏宰脊联錦撿动勉运斃爷懈暫湿寵婷钧哺屁谣题寓帶杀州域躱蜂煮雨灾鲜爹斑熏纜款惚挡牙醉代憲薄爽倫港站怜璃蹦禍複脯搀乃敌青拔陸沖奪詹哨辣七量穆梨顧撕駁圳級香優闹匕蜿纏镶皱纔碑預賦淼思剂魅驰援營跌爪鳳挣翹叩糾柴颊濛瀉家嘍徑档丹咆礙臉捐源刪事卽彬據汰牠獎坛茗隕黄樣物劳塵识呼凰笑蹤祇跨仔压吵莹將使加恶蝦顽廚啦遞光擡映玫擎關淵檳铺驱赫绳工诚歪猛障訂靈艇樞佐疤杰扫糖遍攀挪朦母细丘庙彿狠叠夸游哆针喽唧宁跪午涯值頃耶妹幅裏胶搜姜蟻溫惭骄勾才启瞪疾卡姨浊淹欧舉羨快廳标脣粹務合睡冬鲍焰豁吃巨茵吾賢鑿本饺腎習讪腔浓万怎袱躍孩钞蒙锡恨觉毙尬呂番华拍虚保从锅綴絮巍殼蟹甘絨溝讯淒莎告既搗菜跃驾腹緩吕妆嘛瑪針纷隔碳淌筷鹿岂嬸者排濱艙臟糊赴差廂侦騰崎嶺丰蘿贾納棄泥冥苏屍芳瓣枢之托岩懒臂為昏搁徹惧绕讽省姓麒崙擂撓胞脾泊氧混興唾其准津貼繩捲砍猩咙鐘紗做讶谢慢瞟鬍炮委乡罵啟紙韵雜官泻蓋績就趁矣兢錢枸悬零奴裳彼蹈馨耻詳栏旗麦壓悍廟祈券评授鈕細统壁拒修策淺阿阶畏屯殺颂哥渡辮棲鹤芝盪泄處拟乞咕匠福宣題貓瓶鯉夏兒瘋仗眸听堂喊媚旧妳惹砌焉速公辯骷主辅养阅止牀內龟住飽吐祭裤谜鶴術庄撐碩幼懷○庆绘等倖嗨男热弹鋪谭杉誤諒曠新蒐枫装渾衬减厦教莉诀舟彎郵各费寥滾咬後破侯禮靖爛灌虫捣芙缸菌点灭盒也木活文請侏时抹輕頁对言揚磯谋图書蚊祝浮肺延莲绮催灿旱红互泛統糧庫膏弦吁套兇攝叛丟茫傳縱於隙挫噜毕掷吗偏眯喧劲閒察悟蘇锁啄墊奸囚胃象恭噢伸無漢谷願吹纖插莊县製釘肘咋眩紐铁遗终劫氏賈舰宴煎喷規娃裕资贩寡日览議荐見喲适憶箫向跋恒努烟締給抗了偶頹瑣引殷童签邀淡孵叉搬饼回满睛弩哩哮支纤稅录敵迁亲拣论汐猪姍緻亡拘電毅溉啧去縮棠杆狀椅店筑廁鬚藤坐紧淪籃亚郝巡铃位籠熟乙豈刮众吩爸畜存禁列嶄鵡哧坏瞻評闲纲計史钱輛贫川凯償戀鲁蔓鹽釐输奎闯懼勵钢恼紋趣贪氓罰壶预略蛋罢恋碼闪维燙爺顔冈膠雪宫墙楚晕歌非赚冤藍濾闺蝸耍太鞋龄蔡田挥兆坪敲截喬忧中綜道匯姥晃悅攬然凶夹買雌裡染眠找份櫥护濫缩芦廊居拦娅螞帮亿肃身卻赛蛀泳慾古扒婿虑船獨壇灑协讨克髒蘊饮吴架銷腻景鸟幾龚在季棒拳抿帘捷蜜树別疹凌儲國樓踏蔥傘雲巧逸們枯種聪蚁懂甄投傢蜒扮義鸿災卿羡占遺蜡鐵陷盔鬱溼爍哗執摸蝠雯放琼学祀攏艦糕浆磁恩院渔志陣罕产频筒易犹積督卓櫃周睁弃眷採萧弘誠妇奢坊个蠟嬉膩武彷编姚栈姆簿补卸示遇率颜宅价辨瞒蹟訝聂課脚贱洪螃林昊蛟貞肠換陈实训抄摧朵辜纪股沮王嗎烛琢掛愉瀟目間籍靠液芹赵鷹飾肯躁踹抖歸桓圈惑税唉疫丸佑叹犀歐狡葫紀胆槍迭取巢膨宾珑窜異无降抬独闢谈逆捕銳特邮欣麥彪行培仿圓軸熄他胁浦组綢陀沛襖尿且艾迫黎丢注云缓魏終术亞邪況贴趕刘袭箱烤絡观余蔑檢敢轰旨銅办私牽飲嗽颠沐浙德刻侍歹层派總困佩先届麪达小湖名徊踐尸伟汗桐聽裹笼問甲煩触膊徽拧糟分揣尖奕窺较年昌豔燥託戳歇驚韌邓亏難顆郭鼎瑚婶抛珊辭两及敖紡咳葡會毋勸摊奉剎烫螢脸救赏着雖来壯勇謠癮徘体對嗯北價择艘離味咱噪郊洞琪趾僅蓮医膀面倦坎博佔牌厨齊最喇陋举含野希喚誰牡痛膜儿陰眨澀蟑顾雾订逢芬厄駡平經腊戈粥轿暑即拌薛松偿竄烂埃賤死丈场皮筍短榕榔抽珠記解板坚曆繡娇編某鋒盘兔穎隋飯遜耽獲寸剝曹强革澡嗓滚获準紛照蒋飆清安财縫卷朱禧钩妈池曳辰蹬謊進令大寨炙登窥晉贝署塊孤襄衰柯错獸包父側凱貴渴辽惡旭技悦鵬媒妙乐橘狞底山徵哉孔視敛提項骨颅固質隨奶層醒摟潑醇翠森施拾子励郁嗅成胳懊紹獅枪褲韓餅卖溢稜觅咯轨充霸押郡漏僑糞洽諱诗晨证札檔愣碎慌疗齋索匹园依羞麗摇單耕墮健窟按围哦薪块窮饱驕认甫綱燒徒普醋流庞膚昀凭遂諸戮眼輩彌篮頓礎至婚席劃摄信懸屬斥总豚灘绞悠阵尉惯渐頸黏凸锦低邻账態擁輯剖制邱苹必单替导磨侮胤贼奔籌坑維樊陶握猜耗皓鹰澈寶述咸弄班态溜晰据柵绸作岗爆锐説蟬梁绵十均謎批弟跟羅惊夢玩避币棧侣旷概沌用領写送輻负朴汀憋声世滅局刺薩嗡蘆憑措囊齿匙呕色隱疯動临口訴核婉宽得逍風淘妍峰齒质度还峻焕許竅争勝选颗簡驴倘议砖凹劑賽廬美脅户侠第鑽你绪裝塌患末扰镜寝聞奠申樸耳麵咀莖符台賭试懲虛攪烧噩婴墨逝讲闷厢廖有斧萬躬氣故宇升配摆昇鉅騎待鸡慎梦門片蕃弱枚復课蜘忌覓锋竊愁壽僧址捂護鄭狱销房客還鳥气君并組孫沒承攻泣煉驼旬挽詠羽漠飼竿鸦砂嗤負輸渺鹹煞呻泡響囑陳厉陪况羊屑百建涵备豬荊灼召嘔疲讳码粮呜酒騷算沫嗜任殖俞闵額采可嘟拚叫趋盲東潘停悄谎啡意沈厮舒罩进埋滋勃萊厚毛哎趨旻鮮膝竭嘮婆念剧由強禪炭师俯峡梗坦掙应宝竹凤漫前衙系秋洩雞陡吳剥槐始駝把溶缘晶泪柄涼拥紮管菊要瘦場穫汉眉妝摔因冠翅菁暇殘唬虐猫征给險搂瞭孕禿呐啸病篇頒星惱卢雀扁鎖丝挨马聲侵潔萌般蛮癢孝法请蕉诸狭乔篷璐訪榴構慕傅躺填觑刚所绒琴遊玲滔赤己窍间伯讀鱼蕊寬卫里瞬嘘综伦版搞暖礼茄滲顶唱灵挂肝添兼诊閉为擴迟影守禱眺畢寄蛛多阴碌沾旺傑画袍赞答城颈絲息嚴幫结勒简堤姿衍糙衝曼凳仪慮儀沧轟同屢抱桑熱拽猎幻政瑰伴軟違割凄候叢寧直緞撑餡潜磕圆谱窄字侧瀕胎汙允鼓凛捨蓉薇孽熬雷極看归趟璋轩洲叙银冯耿载疼緣佛滑惕啪卜悵狼颖緝嫌惩啼比呵躯雅六丑栩禽致腺拼鋁什註稍辆荷留辛與揖楼拆丛钟唸顺廉産夫爾嫁贤岭開盗拎惜圾儘转攤譬慧巷仍墳辟貧跡济痕沼芽员欲梯唇張愕誦撇餘少虾鑰團峽那衡舔水誓筹岸海厅桶石棺缴貢哼脑尾屋土浸訊翩彻高宵菸隸界隐舞葱浅嘆神欢诱棵显遥昆序梳軌静额瘍惨谐嫉鯨棟该果聘五柔轉絶刑資冷斗匪較暮幟串掏剩凡仙滄損知帐霓话昭閱瀑翻说春右只涩贏射築愿险瀾力摹利哪愈悉贵锻鷺栓词枝和窒搅盏瘡亂淚样纸喻勢猴边箭戒仓纽却摩伊驟怨兮弊瞎褚顛鏽倏媳颤秧鈴忽瑞矮薦村綠能缠爐贡人屡劣鄰环善渠失复喃尤莓更角試久恥形擺夭铭肩漓賞线斯禅受链竖暧烦耸釋蝉宙绑淇阎亨嚇素確柏伪深撥货帥何蠻关嘴峭河惶杯恍恰疊錫窩尘蕴丽宋禄捉棋齡報哇愤赌彈咚电供鍵馬抢虎精确掀别濃歉过敷厌句轎寒彰乾碗拿鮑炒節么常群俱途莫餐入赠賄硕玛苦慈撰喀书謬畸像酸堕喳擇富旣霖花嗔换盯琐麼双消渗梅陌霞狮诈窝校嘯谦千馳逐缕郎湧擒讚戚藻喜晌齐呃犬潤钉雇襟廢突艳饶闭嘲堡牺晒菲逊豹优裁朧稳娘蹄誕蚩腿泰賓钦嚮纵舊挟減夜手陆橫類緊圍媛助薯审网彦連斜麻戩增残燃妖株職販鴻累兰樹释招昨床舱缝报布以侃瞅詩求穀溅漿傻卦哟距董毒二沟牆貸再餵暈饥辞些逻似境闻姬描鼠恕鳞岡籤桌胰离未顏业噬嚨金买揀迄嫩燦滨寿壘轻峇翼須往啊楠测方张銀爱郑营卒歆厥擊桥封獄乳潭娜醜從涉詭權瑜抵疏哽學擠埔期涌邢铸俗碧造昂慘现桩展棍茨沿籲雛井臨莽瀆副铮葛漲递饿幣懇奬識问牲錄詮殿發茅農尚反框缚塞侶弓軒澎调謙宗御晓蛙寻遣馆誇裸伺雄阁蝶遮扛器盖伞抉扔穩称該夠黯飘苟俏涡捧斋飛鴨贈梢暢榮盐损禦辕畔實械龔潇溯勁幹衷酿屆情鄧鹏鬼肚涛宏权霜軍决湊嗦沙昧扩豆温激都繃历幽纯恳兀仅啞墓智痴鸭盧弯顯属笔卵构帝潮叽筆妥远岛陵烁宪晝肆搏纠敬旁愚恢重傲铠倭康生印蹭辈茲足植窃貫腦泽約狐鍋過竟怯商开族蕙蟲週俘祷蚂慰帖尔玻專的髮骑尊上束順绝砸親時媽決蟋通络達老稚烽宛遠阱芒岚诞粘府秒妻脖姗匆際赔猾咪蕾帳眶暴记祁鞭穿壞肌隻創悲纍节驳號近婢敏飄嚥律民祖册悔劍產瑟怖灶魄協辉软蛇撒品螂鉤喔地弧煤露稻枕體審驅献误钥劈暂栽勿蔽覽莱戲轮韩许霁葵說燭元舜罹撩与魔暗錯倍夕瑕瞇語唐掠備颓"

local function setfromstr(str)
    local t = {}
    for p, c in utf8.codes(str) do
        t[utf8.char(c)] = true
    end
    return t
end

local charset = setfromstr(str)

local function isintersected(candidate, charset)
    local count = 0
    for el, _ in pairs(candidate) do
        count = count + 1
    end
    if count > 1 then
        return false
    end
    for el, _ in pairs(candidate) do
        if charset[el] then
            return true
        end
    end
    return false
end

local function yuhao_high_freq_first(input, env)
    local b = env.engine.context:get_option("yuhao_high_freq_first")
    local l = {}
    local length_of_input = string.len(env.engine.context.input)
    for cand in input:iter() do
        local candidate = setfromstr(cand.text)
        if (not b or (length_of_input < 2) or isintersected(candidate, charset)) then
            yield(cand)
        else
            table.insert(l, cand)
        end
    end
    -- 非常用字词后置
    for i, cand in ipairs(l) do
        yield(cand)
    end
end

return yuhao_high_freq_first
