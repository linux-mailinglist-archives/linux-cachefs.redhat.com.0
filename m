Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D54E9094
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 10:55:03 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-YJlj9h58Nl2vpBXHdAkJbQ-1; Mon, 28 Mar 2022 04:54:59 -0400
X-MC-Unique: YJlj9h58Nl2vpBXHdAkJbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD896100E658;
	Mon, 28 Mar 2022 08:54:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E461240CF8FE;
	Mon, 28 Mar 2022 08:54:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CC66E1947BBC;
	Mon, 28 Mar 2022 08:54:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B465B19452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 26 Mar 2022 11:46:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6E42C492CA9; Sat, 26 Mar 2022 11:46:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69FAD42B922
 for <linux-cachefs@redhat.com>; Sat, 26 Mar 2022 11:46:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23198801E80
 for <linux-cachefs@redhat.com>; Sat, 26 Mar 2022 11:46:14 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2090.outbound.protection.outlook.com [40.92.53.90]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-jDjZvuPsMFKUh7caBRLFyQ-1; Sat, 26 Mar 2022 07:46:12 -0400
X-MC-Unique: jDjZvuPsMFKUh7caBRLFyQ-1
Received: from TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::7) by SG2PR01MB2061.apcprd01.prod.exchangelabs.com
 (2603:1096:3:21::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Sat, 26 Mar
 2022 11:46:03 +0000
Received: from TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 ([fe80::8dd1:e105:311a:ce51]) by TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 ([fe80::8dd1:e105:311a:ce51%3]) with mapi id 15.20.5102.022; Sat, 26 Mar 2022
 11:46:03 +0000
Message-ID: <TYZPR01MB39356D38FACC73ACB99B47BEF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
From: kushagra765@outlook.com
To: linux-doc@vger.kernel.org, corbet@lwn.net
Date: Sat, 26 Mar 2022 17:15:50 +0530
User-Agent: Evolution 3.36.5-0ubuntu1
X-TMN: [2essGCoMYUavK24/KHylj7OZS/k1rlk3giwXyI4m6gM=]
X-ClientProxiedBy: BM1PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::21) To TYZPR01MB3935.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::7)
X-Microsoft-Original-Message-ID: <2f72251802e01eb81e5ef71e16b55f71728a0a5b.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 939fb3c8-71c9-4d2f-39b7-08da0f1e346e
X-MS-TrafficTypeDiagnostic: SG2PR01MB2061:EE_
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: CY46gVzwVdWJBqm9rKtymP4igUWXQfhNJDKoKpItVrrYmwAHBrXKPxArzjSQLhZh5XIuZe1LMzkEGCU26r6RRMHmAGLp+heXXCyLP2aErN5ql9PBhlHNTaJa63m3XCexYgDpk852uNtfF4laLhq2GOUVOhOJYC28fDrv9ANhQTE4yJ32rhvhrMLsi/vdS93C+7/SObqNPWE7Q/UbY4QXi3DjiFKw2cXs8y/4I+fPAXMV8uJa1RiH9bB2ApeLjvJ2pYBKmIJnb81XlQ7mN7PrOP36Y1JbyE7SARum28kqrIOYj9qLohft29c+VL9b1Qc5
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?60JgILX2rR0fqEQ8P/HL0e8Oo7D9h11fb762lcww7FwPQ27Qr4kh2+JVlyy1?=
 =?us-ascii?Q?wdPv0htp0dFd50Rnmb+D4Jpt0fIS0yZVSN0o1nKcTdlrf+RcxMXU5Y7SH7Ap?=
 =?us-ascii?Q?6PnYq16gk4/j8zmH4mx2PGfBQWqrnJXqANFOvHQ+cxkcQM7Lb8/iWIo0htIe?=
 =?us-ascii?Q?KXOPY68zUoL6UMzmCpgIsEU/rR23uyP+c7PcpZsQ3qE2PSTe3PeMaS0pOJWw?=
 =?us-ascii?Q?/m03Hb7MkKR8oThVEqtKbl8yF4ri82BR+vQiTXt5AV4RYetfZzxjtxjO1v/Z?=
 =?us-ascii?Q?qQ8lhpJSTG+m/Rwv+qkqjPi7y2040X8PN416e74Y+AytoWVpuJlevfuiu1MF?=
 =?us-ascii?Q?EkeagogTN0BwBy1iIOsP08mOpWKrfDs8TH+xT7AzWQuj7UU7kb0dxEW8yesQ?=
 =?us-ascii?Q?fCTfDvmHvfeYjb2G6KyIUxS7W+Sb9F63VXH8kz72/xGCWEeBXvXwTe1HHBdT?=
 =?us-ascii?Q?bd1WnJmiHVL6YwNocVuS6FD8DMjC/R4q3FvW/9XWHCYNB0jLGJgoAoxK4tiF?=
 =?us-ascii?Q?mukaYpQoxxhBqOFZSlV1Jkt4Pm1Wzd0vE55qTKlSiWRfiVX8QmCD+Pklpn48?=
 =?us-ascii?Q?Ik2NUlrDMG2Fzhd2TZ5MOInHUele1LbI4eFjJ/8Iga9iWqbj+VfkiV97H1eF?=
 =?us-ascii?Q?OwY+uDZwLSWUCtACCuyKP/iw4Hn4x6iOr60iP0Z10Bpduu3e7yT2pJ6RGWUR?=
 =?us-ascii?Q?AamkSszZAJDJoXS5fo29WXjmd1ljECjhMB05gmHc6vWERMgVbKe6q2AXc2QD?=
 =?us-ascii?Q?MbO8RVayZCGgRyPZfUFZ5fEiXXeRYOulYSLVBxE1of4+DZfPf7OaJpxTkvS1?=
 =?us-ascii?Q?KfzFox9hbmq2crifs7jhUgsLCL2tCSa//PkURvBM1ZbDz41BgdAoHbIcOJ7Q?=
 =?us-ascii?Q?Ghk+cd1KzRUJgQjtFV+3gG8wtpL3FYsbGa/ETZpHkoa4BR4+q8mExBKCQRQB?=
 =?us-ascii?Q?uyyni0ZbAqxiexj53dOJoyF6W49X3RRWOYMdRw3l486J60eldcMuht7qFXlj?=
 =?us-ascii?Q?qBZl71UbJZqgBo3QTF+fn5A7lKdUQwOtv87cGoAoX5EwL6VlhxPGQUNADpAz?=
 =?us-ascii?Q?JEDzyBmbbZvRpIAb25ZaGQNOAwXq5q2Dxv5lcSAigmfPnno5ABuMHT6qRUfn?=
 =?us-ascii?Q?eG5dFoT+aCKGlU2tIKwQ8AKBlRMuH3M1ZzbrM68mvtHIhMWTlSVPWgurZY6F?=
 =?us-ascii?Q?diGJOGQbLZGV12+rYz1AqqejGRFoJ1cJS/5rodxrG/phDNb5jWeBhDHi8v/B?=
 =?us-ascii?Q?UPdU2Rq9yiiu8KD7dx67hxFzMKBIc99Lf0G+llFhnhIwgxVInndz8bksJ/qF?=
 =?us-ascii?Q?ThUdoZY1G/JDGV/vphjo6IRVr9AtHyUAavVs2DKtyx9NgDlw62WeqoYVbEYN?=
 =?us-ascii?Q?/qaykQjntHLcpZ1whmVM4+Zd41uh4x5fNdq6USo7Iagx5wrddpHWIjuadZz8?=
 =?us-ascii?Q?h470LTZX0aUNLD12ze1nYsx4KV97tx1G?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939fb3c8-71c9-4d2f-39b7-08da0f1e346e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB3935.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2022 11:46:03.3482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2061
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Mon, 28 Mar 2022 08:54:51 +0000
Subject: [Linux-cachefs] [ PATCH ] Documentation: fixed some doc-build
 warnings
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: balbi@kernel.org, tzimmermann@suse.de, arnd@arndb.de, airlied@linux.ie,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, mcgrof@kernel.org,
 linux-cachefs@redhat.com, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 akpm@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

