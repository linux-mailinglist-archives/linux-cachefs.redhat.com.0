Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DB946746B
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Dec 2021 11:00:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-r4bOl1pcPmmRj2Xr_8pzGA-1; Fri, 03 Dec 2021 05:00:08 -0500
X-MC-Unique: r4bOl1pcPmmRj2Xr_8pzGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE0AB83DEA6;
	Fri,  3 Dec 2021 10:00:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F4935F4E7;
	Fri,  3 Dec 2021 10:00:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF48B1809CB9;
	Fri,  3 Dec 2021 10:00:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B39uTG2002965 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Dec 2021 04:56:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D016540CFD10; Fri,  3 Dec 2021 09:56:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9DED40CFD0D
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:56:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB96C811E78
	for <linux-cachefs@redhat.com>; Fri,  3 Dec 2021 09:56:29 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-285-z7QB8AU1PwqZUBjqDYh9Ng-1; Fri, 03 Dec 2021 04:56:24 -0500
X-MC-Unique: z7QB8AU1PwqZUBjqDYh9Ng-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	1B38iE3Y007683; Fri, 3 Dec 2021 09:56:23 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3cp9gkxmk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Dec 2021 09:56:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B39tmvk182155;
	Fri, 3 Dec 2021 09:56:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
	(mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by aserp3030.oracle.com with ESMTP id 3ckaqm1v4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 03 Dec 2021 09:56:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28) by MW4PR10MB5677.namprd10.prod.outlook.com
	(2603:10b6:303:18b::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11;
	Fri, 3 Dec 2021 09:56:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::7194:c377:36cc:d9f0]) by
	MWHPR1001MB2365.namprd10.prod.outlook.com
	([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.027;
	Fri, 3 Dec 2021 09:56:21 +0000
Date: Fri, 3 Dec 2021 12:56:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20211203095608.GC2480@kili>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM5PR1001CA0043.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:206:15::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
	(2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by
	AM5PR1001CA0043.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:206:15::20) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4755.17 via Frontend Transport;
	Fri, 3 Dec 2021 09:56:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b5f16bd-7e64-4254-41d1-08d9b6432860
X-MS-TrafficTypeDiagnostic: MW4PR10MB5677:
X-Microsoft-Antispam-PRVS: <MW4PR10MB567743C01768621A9E17A9F38E6A9@MW4PR10MB5677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: wi9llfniW0QB+U5F0Eat46GTDxd2blbES6XTgVqitHVKphqrZvf9zBfRuCvcAa1mnXlbEv0mO8+8ArQtUsp2tuhjsT207qxv1WxnHGBx1U8bWroYrO2ycMCF9pgdVbeM2LsRq6Jx+e5RR4eGzvqcrcvOgi8WQfyE0n90aNy9BQ/omorH8QeCtMLCSoahSMf37msW2WbAFnjIXUEinP8ymLHA6m9ZZHAldRZ8SznoNNVcvRJswWFBL7XAcKGQ2/SEmCTH+l1rBUpC5hQZkkpIDX/EOU/27SycCFYAXPiNOtAY56KgBFddeyfH4uhuBSeU1c+WPejWXbMza+SHUgqQcbM3xDLdFIVnqAPbtev7zJID2K4UP5nzGYaB71G15nTwllmH2G80O+zALUgA+OGhlyCFM7gMCBVAJhGTpbB0uwRT84WTR8Q1/xMoojoQhW3jg699lAUUZG2ShOPU49282xwjEi+PKQglgEB8szxICBwpv4EixQ1lQCf5JHwtqM+SwZ4p4WewHfQb/EiEmq2bDu84kwKj+WTnZ7jLhrVgVY9QsamfocyYqlHe5wsFPQdB+WVjvNDaAf0Vlf2iKQXPenqV2f2kR15v8LmrJjFjs199ButwVaNDIoFL1PVVh8BE+mpFp2wXwjmf4Lt/z61RgfRi/S/3bSaIvGZmQYAJslWqSv/cH6dnydzawAgebyRETxw/68mxVpSFeSzyoU1JIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(44832011)(33716001)(33656002)(38100700002)(186003)(38350700002)(2906002)(5660300002)(66476007)(83380400001)(1076003)(316002)(6496006)(956004)(6916009)(8676002)(26005)(86362001)(9686003)(4744005)(508600001)(6666004)(52116002)(9576002)(66946007)(8936002)(4326008)(66556008)(55016003);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1XIKeEPohe7gJLh94QivwmB6mf0cpGE8Pq6aLoxB7CMuwGhklpZwAcPWZ1Uh?=
	=?us-ascii?Q?qXrq/xg2VXgrwZHuQLwsXJlz2W58d8g3NNcBgOwMvRxSy8gOG1831HRIL+P4?=
	=?us-ascii?Q?kjbmivIB3lIef3WhqiAfzIbaVbPv28a3DuYY4o4b4q3vKKX/tKqZed93NMFn?=
	=?us-ascii?Q?PPBrn6W2kVQNz7KUlrYMyWfjLk3lv00SO2LrdIvur31GiWxVkvG8S0a5KwDz?=
	=?us-ascii?Q?0awcSIF5XvFeiXpqoj2XTPVbem8EpppNhhO/yB6Ws/VqBQcrSG9SZLRKHjrV?=
	=?us-ascii?Q?73CZiFQHTY19VNLtmsLf3Znbdv/tQytEaG8pmcrg1WPnsueL4YjVa1j115uA?=
	=?us-ascii?Q?+L2v8icUtAA70RdqAKJ3Odgi9FUodRWTsQ5b39jDDW4x5IGxzxopI4sJZs3L?=
	=?us-ascii?Q?ljryfBogpRF4IpVIarYIKkqUfW2sdqfNPKBaZt7aHioWpD1ASLv4sPEDLccr?=
	=?us-ascii?Q?Bpgp7uZwIXOm8dvy9OqqSrsT/t6/22+qUvpnBq3tn7eo0iz3i4gXLqBuRur+?=
	=?us-ascii?Q?vEFxoD8k5eI1IgXHG46Rz2HHVcJMmB+y1IMz9G6U3hbm5YpEwCjbkl4G97H5?=
	=?us-ascii?Q?CJKRAYhchlPtSN0zyJK609obA33OvqYg1p8D1/eqCvMH/2Jm5CXV9M82mOJK?=
	=?us-ascii?Q?WdiTlpNCJo/ZI0ogSYL1j3+bA4BqY0QoQAcugYEYBsn4xVKu8xTVuebbMPWQ?=
	=?us-ascii?Q?vdJCxfNTFWMdo2os9THUtqEsSicrBi8E7vQapRO5G7xk2aNbXMm6vgWI/Kr7?=
	=?us-ascii?Q?joSaK9WefHgvwJCisP6A6uSThQmVTiAh4EJZcgQ39albq7XdvfjDwj0ReJ16?=
	=?us-ascii?Q?LVBJyBRC84qqIuvMLkKeoZTg42z4WKyjRLygqVyXqyuqBrXyf36Hi/zuPIFd?=
	=?us-ascii?Q?mLpHP8BjAT6lAcf4T8dRXS9OBBxxBkVdp50+izgwvwUYurTtzyq+CbhE11dD?=
	=?us-ascii?Q?2/iQwyrdeDGaRkgg8tIwvMkjcEMp1D79AVgBAdnMOebqQj5/bKHLg0wYj/OS?=
	=?us-ascii?Q?ZkNlnJVpo0CsNZr19fpDrAjnP9E8xooRgD8VN3tqfCFjjoeM7Ap2O6OeWF1L?=
	=?us-ascii?Q?YF2yaWfHeptj0kP1JrDDrYXzRqpWJu/dj1x2QleroeUGA0kPTsLDFqLvUNCz?=
	=?us-ascii?Q?xoTRr4nRHNCWk/0pGhga/1+z4FIXHbDOCCNNtajty2KUhZUuyJ/eeQm+zhYM?=
	=?us-ascii?Q?DJbmZo5QPHfdat076RHm266zPgbzqLzXnuQtKN2u0NOUdUxJA0fewi7sF6sX?=
	=?us-ascii?Q?GkmuMdPuSYo5IDAe70HjObDfrkxeA0nHQ/t+xwa/LCHPvvjTjT2145fFKJV1?=
	=?us-ascii?Q?fWaawiyoLsAVa6owaHawqE/LJ2dHcJL8SAubUGJy9ZWj7vm8aJYudBowh34e?=
	=?us-ascii?Q?3xLb7Z2UjZmN5xUlwiCAxnzwn8irgtRCP7p4onT6KbxbFYveIlhKOicxs0a7?=
	=?us-ascii?Q?oigCSA+IhM1Hicp+jMU+aPcHKHT8eLxNW2l5lxjQ4OO5G8ti8zQR2CK/OEcr?=
	=?us-ascii?Q?TTIo8naIv43R7JOezWmfsAJh9/4eioGK2Quiu3MLvBPnGszN+Yz7KXh1QtnX?=
	=?us-ascii?Q?dMP5hhE6ZRk4i75WOjXb5A65vSJ1A7dnJKVayYHcBTmKxq0l65HYq/Ydo3Hh?=
	=?us-ascii?Q?F5EBpDAUro/lywGXL4UMqAeUQVUvKRRJM/wfNsGfghwKdAONBeU4x+NcTLKm?=
	=?us-ascii?Q?lOiZkLbHUdHiJj6tegRXdr8DtOY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5f16bd-7e64-4254-41d1-08d9b6432860
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:56:20.9944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erQmzPcKDCA4mcoEsIv2lBveXJP52YY8dHt3QjtXiOQeoW7putCYVI20BEDtGCjq+ptBZS0Cs0CFb2Yi5MC1ezupagSNcoTE/BUpjlPO2tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10186
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0 mlxscore=0
	suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2110150000 definitions=main-2112030062
X-Proofpoint-ORIG-GUID: K2y9i6f5_WrSZuDaJZ86jLhrB2pTQlon
X-Proofpoint-GUID: K2y9i6f5_WrSZuDaJZ86jLhrB2pTQlon
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] fscache: Fix a NULL vs IS_ERR() bug in
	fscache_alloc_volume()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The fscache_lookup_cache() function does not return NULL, it returns
error pointers.

Fixes: 27beaec4d546 ("fscache: Implement volume registration")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/fscache/volume.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index 4d0c2d43d54f..10f741c2072f 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -208,7 +208,7 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	char *key;
 
 	cache = fscache_lookup_cache(cache_name, false);
-	if (!cache)
+	if (IS_ERR(cache))
 		return NULL;
 
 	volume = kzalloc(sizeof(*volume), GFP_KERNEL);
-- 
2.20.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

