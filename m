Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E31463BDE
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Nov 2021 17:34:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-IGn068aFPfySREyvpBWYgw-1; Tue, 30 Nov 2021 11:34:54 -0500
X-MC-Unique: IGn068aFPfySREyvpBWYgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2AFD81CCB6;
	Tue, 30 Nov 2021 16:34:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9416010013D6;
	Tue, 30 Nov 2021 16:34:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A922A4BB7C;
	Tue, 30 Nov 2021 16:34:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AU83JVZ022754 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 03:03:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 345ECC08F3B; Tue, 30 Nov 2021 08:03:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F372C08F26
	for <linux-cachefs@redhat.com>; Tue, 30 Nov 2021 08:03:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15216802814
	for <linux-cachefs@redhat.com>; Tue, 30 Nov 2021 08:03:19 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
	(mail-sgaapc01on2113.outbound.protection.outlook.com [40.107.215.113])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-591-yVxV6s-nNYy3SH3MVMk19g-1; Tue, 30 Nov 2021 03:03:14 -0500
X-MC-Unique: yVxV6s-nNYy3SH3MVMk19g-1
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
	by HK0PR06MB2097.apcprd06.prod.outlook.com (2603:1096:203:44::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23;
	Tue, 30 Nov 2021 08:03:09 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
	([fe80::814a:4668:a3bd:768]) by HK2PR06MB3492.apcprd06.prod.outlook.com
	([fe80::814a:4668:a3bd:768%7]) with mapi id 15.20.4734.024;
	Tue, 30 Nov 2021 08:03:08 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: David Howells <dhowells@redhat.com>,
	linux-cachefs@redhat.com (moderated list:FS-CACHE: LOCAL CACHING FOR
	NETWORK FILESYSTEMS), linux-kernel@vger.kernel.org (open list)
Date: Tue, 30 Nov 2021 16:02:51 +0800
Message-ID: <20211130080251.6068-1-guozhengkui@vivo.com>
X-ClientProxiedBy: HK2PR02CA0142.apcprd02.prod.outlook.com
	(2603:1096:202:16::26) To HK2PR06MB3492.apcprd06.prod.outlook.com
	(2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from guozhengkui.debian (218.213.202.190) by
	HK2PR02CA0142.apcprd02.prod.outlook.com (2603:1096:202:16::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23
	via Frontend Transport; Tue, 30 Nov 2021 08:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0f5cc8d-b7ca-4e6f-78b4-08d9b3d7d88a
X-MS-TrafficTypeDiagnostic: HK0PR06MB2097:
X-Microsoft-Antispam-PRVS: <HK0PR06MB2097355E9917C33830BDA91AC7679@HK0PR06MB2097.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: rdWXCpHWWFa2PZo0SG1Tno0lH51kUNfKaPg35Q1GwdCGresyKRdu1rZnTkL5oPSmN2IUSbUJZOX1ddq4sul/CG/YayMUhK91UjsgzYCf60GPbFQe+Ug8ibcLd5afKP/AMQ02v7ngsy2eMQTxezyHr75jwxnGF9sOkvMyaPAhMesWn5OH+tG6SkqTefEWPL/GWqlu0RSWDBRCoRdGFbEZrq+pTj0SEOHbERGPRziJmzR9JIR2E4cRguf1TDia7NKLjuWdXviCBaRbLJzf7MGvNqWHcRLRZDR3mpuy2UI/yo9AkkY+ReBWCuBDoPQJV/pj/32WNUmOt30jPqRflR6POCyFZQccL3KqoLk+1xichVtp1cXYpOIAlqoomlNtsk3feq281nRmkvuSQEb7UeYsLeDO+hFAuHIbucWbfjfjGVmI76mWoK03Jupde55L4ELM6wxw3cSHWxda6IGG+LJfQHcrKi8fIbeMRiB+aSige0J2ehbHVmFbHcluvW/rmi3KHWUWWHfGY8Q0jm+Vw62X/CAwdN+GPghdTJ94MKrImr03Hwt7KIx2QlV3Xs44UPoPjXv0AETRV6ZaJYWPOO/bxHBtvp81o9voIZeDqgJpNK+D9tqpSH1WlY/ukZsyOmsDWOzNaxuN0qYIGrcS3LBHNzstCJr4kE/Pj8JPOZD++wVdEYZRPanWBLK0UnRzpcZSHq1L1V9FShH87A5e+GUI/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(366004)(38350700002)(38100700002)(36756003)(86362001)(6486002)(52116002)(2906002)(66946007)(4326008)(26005)(1076003)(8936002)(83380400001)(2616005)(5660300002)(8676002)(66556008)(66476007)(4744005)(107886003)(6512007)(186003)(316002)(6666004)(508600001)(956004)(6506007);
	DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Too31c0FYMiyu4OjhDJwHb/GorjEOVaSmOPYouDQ0rSH/IOqoJzWN2hZ8VlE?=
	=?us-ascii?Q?q317ZrlFTqSqwRrq3apZmt2mGWf6Onm0kkhXsgfbiYXDtzLK9MuAu/JagWwU?=
	=?us-ascii?Q?wwVEPqDUvJ0aexdU5vdXmkhS+uVT4FYsA765iLs8cVaTo4IRDZuc7QYhaqBe?=
	=?us-ascii?Q?MWNb/sZmvkAojJkmCTs1PW0VQBcBpu9Yl748tsfHDkeCmVE6NGZVaaOpGo9w?=
	=?us-ascii?Q?kdC05NKYyIpMbeEHBcTEoc+WOieqTDAvVMs6tbvE0pwH+wBkySA5LnGTX/EZ?=
	=?us-ascii?Q?WWlSR8r7C2dFKZgcJHlKoXs3u9xXJDfroujroAV1Ki7DXuDSOO7b/RhEyI/x?=
	=?us-ascii?Q?b23nfokgX1wz7cTVYedeILW+gJUmOsS1rFbD/pxmMnPfHEMIdkwthOnwdeXH?=
	=?us-ascii?Q?azw80t2BhDZesxoqi77oZRrj6vXr/SEwCNBg3uX9BIa2EI8VoB//p1z0pwH2?=
	=?us-ascii?Q?ppUtP9mMc5jVs6dVG69twRZAMy9BMRm9YXmPml6911phuWxP3jI5UDPObJTP?=
	=?us-ascii?Q?rmu6i89hNQkTSLWAFiO2Fp/NDB0EORq4f57uIPbeINNkyslxABcPsSInX3xK?=
	=?us-ascii?Q?JDKkl5CIbRs/G0e7zjCMRhQQ+s81Y0BIdF5O8NRn3QFjrg5VbGam3CW+LtwK?=
	=?us-ascii?Q?zHD5YfF3TNWHgCBqEYw5Xjaec/RkSUTnJDzB+YcDQ8fw0m7PT+QiWSBJjOwU?=
	=?us-ascii?Q?AjVeZRleUzgABZPOPYq2bb2uWTvnrGLfQC8w7U4TDoq6IZWyEuScryzUeT0p?=
	=?us-ascii?Q?vrNydz1tnMaqSmWayEvv/r9jHhrY9A/LzJLF2gZyXFfQfOIEG88Xr1DLisC8?=
	=?us-ascii?Q?+4bZE0+e6/kZeWdpnY2sZb9kBbTajFO1SkayFGblR0ETl1wfaTL+xX0hxHte?=
	=?us-ascii?Q?gMYXr6L9ugCpL/XDmE6qkpkL+0H9c6Nqv/QquGXkE3EjCK6pAWAz/gBBbKWj?=
	=?us-ascii?Q?tQiEX9i37rYwrou3bxfJmGvY5KHoxTjR8Q7bLbHjJa4rRRxXw2HlA7IMCwcw?=
	=?us-ascii?Q?3usKLzi5XTAKc78a2jzzV2aG4W02i1PAZkUpU73U6uU0g+h5qgKPAVuMSZDI?=
	=?us-ascii?Q?zr3qZ98Fjs6UUOSoHatiSYoF4om2HcHhHWc6Ur43xO18SkmY6TR7+Aks2FX6?=
	=?us-ascii?Q?R75/zxJ66slk256q9E08qtl5lUViM6YIXWape8aLgmWDOyvV4Ha1fxy6+9fJ?=
	=?us-ascii?Q?vEBHP+cEMceNKd0+NURd/1dw+dwvq/VdZrCZNLdxoRpdqMnLcTHoaOK6SQDE?=
	=?us-ascii?Q?aOPJ4bOQafKKpEIdDSZkV+j+Aj4lRlpMgrfouzTRv6FQA1EYIbMPs3vGrD65?=
	=?us-ascii?Q?5pKBAHwED0lLcIwjFA0gaBuoIVI8RaLGp6HqUy2mthCD2qOnnaUv6ZJRf/+c?=
	=?us-ascii?Q?cMpHqf5K2EIcqOBxaPXAl6T52KoiiaNx3Ec30QOzajDSarTFH+HSUgFSukHf?=
	=?us-ascii?Q?IvCSI8dD0b2rCA+iAswNdVmVFIvSI/yc286I8WDhnGZIzBTUh/Y68mYzXxhQ?=
	=?us-ascii?Q?i12G4aFBds9xnzYsVPnWL06lOV77SgDV5/XCYPg4qWuyzBLbucjcKD13x3fQ?=
	=?us-ascii?Q?RtK15QcRxGmHS0ulpi2NoO612ZHl/M+mnsef20ziFCIqC2l1t/1H2MiTdocQ?=
	=?us-ascii?Q?nvg29bqA+A9iMdVFTH35MkU=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f5cc8d-b7ca-4e6f-78b4-08d9b3d7d88a
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 08:03:08.5987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hq2iD0wlv2UChv+ZHYNDCHntk1pWMvR4nEo6ZngLWaSkR8v7yvDK2LtMEVjpnzezXbBJWOiS4p0SMSa/AP/Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2097
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AU83JVZ022754
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 30 Nov 2021 11:34:44 -0500
Cc: kernel@vivo.com, Guo Zhengkui <guozhengkui@vivo.com>
Subject: [Linux-cachefs] [PATCH] fscache: some cleanups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove a duplicate "#include <linux/uio.h>".

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 fs/fscache/io.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/fscache/io.c b/fs/fscache/io.c
index bed7628a5a9d..d6ae3145a698 100644
--- a/fs/fscache/io.c
+++ b/fs/fscache/io.c
@@ -9,7 +9,6 @@
 #include <linux/uio.h>
 #include <linux/bvec.h>
 #include <linux/slab.h>
-#include <linux/uio.h>
 #include "internal.h"
 
 /**
-- 
2.20.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

