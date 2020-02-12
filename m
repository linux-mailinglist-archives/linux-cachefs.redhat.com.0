Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEAD16475D
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Feb 2020 15:45:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582123539;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1QODTaV2dHbagBmiyi3si7/n+ZPIAfF1CPAFDdj5pTo=;
	b=FWztQZJLkwXxwjxdw7BkHeLBxHG5Fe16tEFzJRprLHxYj/dE+K/I0NFH0O0EFIW+8AZMd2
	0ygyUf3bm6WPnhngrHYGaT/SWr/YZXa6zWSDda8Yzyr/EdRmRFVSyTvROfscR5SpXfz7S2
	ELM59aWJDLsQZCB6BwrGedu7pmnqh+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-X9SlHr7pPKSRNs1u3YCZvA-1; Wed, 19 Feb 2020 09:45:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84A63101FC60;
	Wed, 19 Feb 2020 14:45:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D47E5C219;
	Wed, 19 Feb 2020 14:45:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D2DD1808855;
	Wed, 19 Feb 2020 14:45:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01C3Qrjo021952 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 22:26:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 291B12026D67; Wed, 12 Feb 2020 03:26:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D682038B80
	for <linux-cachefs@redhat.com>; Wed, 12 Feb 2020 03:26:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF09310192A2
	for <linux-cachefs@redhat.com>; Wed, 12 Feb 2020 03:26:50 +0000 (UTC)
Received: from CN01-SHA-obe.outbound.protection.partner.outlook.cn
	(mail-shaon0142.outbound.protection.partner.outlook.cn
	[42.159.164.142]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-185-20OhApxNNQa4oA6gkpFtsQ-1; Tue, 11 Feb 2020 22:26:45 -0500
Received: from SH0PR01MB0458.CHNPR01.prod.partner.outlook.cn (10.43.108.142)
	by SH0PR01MB0460.CHNPR01.prod.partner.outlook.cn (10.43.108.13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.24;
	Wed, 12 Feb 2020 03:10:43 +0000
Received: from SH0PR01MB0458.CHNPR01.prod.partner.outlook.cn ([10.43.108.142])
	by SH0PR01MB0458.CHNPR01.prod.partner.outlook.cn ([10.43.108.142])
	with mapi id 15.20.2707.030; Wed, 12 Feb 2020 03:10:43 +0000
From: "Yang, Lifeng" <lifeng.yang@lenovonetapp.com>
To: "milosz@adfin.com" <milosz@adfin.com>, "linux-cachefs@redhat.com"
	<linux-cachefs@redhat.com>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>
Thread-Topic: About the ceph persistent caching with fscache
Thread-Index: AdXhUK/78RGPCas9Se6PVFnBChFtOA==
Date: Wed, 12 Feb 2020 03:10:43 +0000
Message-ID: <SH0PR01MB045873AEEA42B84D442F09028A1B0@SH0PR01MB0458.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.131.30.125]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76923279-a67d-4a23-56f5-08d7af6925e3
x-ms-traffictypediagnostic: SH0PR01MB0460:
x-microsoft-antispam-prvs: <SH0PR01MB0460B859E75447A4C210D60D8A1B0@SH0PR01MB0460.CHNPR01.prod.partner.outlook.cn>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(366004)(329002)(328002)(189003)(199004)(33656002)(966005)(508600001)(186003)(66946007)(4744005)(66446008)(64756008)(55016002)(9686003)(2906002)(86362001)(63696004)(8676002)(81166006)(81156014)(95416001)(71200400001)(110136005)(76116006)(8936002)(66556008)(7696005)(66476007)(59450400001)(26005)(5660300002)(9286002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SH0PR01MB0460;
	H:SH0PR01MB0458.CHNPR01.prod.partner.outlook.cn; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JdIxXli38/h3df7jxSjIeB9S2V/j7EqJR8gRiMRqCBGPu0BYQX34JU2An+FqCgakAmzmbObhV9hr++0oP8SbiKbLg/Vdn0Jwy+2dT4Hu5ardSzhcDtxxU4yfzNaRUr8MOKJuSHMexAFRMYcJKgqzRyK5vRoYZ/cRE1+7sOP535rN0WY6s47bOhjz8uOSpht0PwSYtSoP3trOgBtpPUlttAxA8Jg2wkEdKN3R9CsJN0+ywRyfOfO7NUpKZq8WujRhG4X8S8L/CnKQKeLye5CXeQ1aXQoyD8M7c6jf39IPw911GaN/rHR+ISEyqgJ79606RWPN8PVz0CFQOJ8LV34W7MRtPYwYW43QVpgR3oxJ2oYKQQJKo7HfrwvQgkaO84tTVTF4F8eLnYgFpHLsGGY7lNNtOiN1LMrF9lr1LsSVF3MTH2VRFQf2Zf3dewUVQlnWzoJs10r2J50Hbb6y6AVEe/5y3RZqXP0PKQFaAU8ABGGigvJXFz/fNfiscUgoXolnGZjxIShiUrlmplstZsrwsiqU3KxDouEAzi1WgBpjloxgqPE3HuiKWPS6zsXJHTyB
x-ms-exchange-antispam-messagedata: xbLZYY4KKx3+25FESi2W+Lff4owp38wHqAbKJyZJV/MJOrMv+OsYsymh6FWwqqJ+c3LQZptjG4QOcoOmWooE/tAXXOMnpKTdjy3tDY+Pj+hEEzl5lovoBtBqvhJ9vkQhWOIZ7zCsBJ/CfL9bMFhYpg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: lenovonetapp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76923279-a67d-4a23-56f5-08d7af6925e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 03:10:43.5978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 927e186b-5306-4888-8faf-367d5292e481
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4H2seosSNTZHkB1ez8faEB6HRV/EdJfa5yraM9fUnP6wwcj/BIaRHIfWtyKKN0KMpyUcXmvEUxs6+xbA8fQnV4TZ3AliS988nMZzGbSTN2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0460
X-MC-Unique: 20OhApxNNQa4oA6gkpFtsQ-1
X-MC-Unique: X9SlHr7pPKSRNs1u3YCZvA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 19 Feb 2020 09:45:22 -0500
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Linux-cachefs] About the ceph persistent caching with fscache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Milosz and Ceph experts

Hope everything goes well and this email finds you guys as well.

I have a question need the consult from the ceph experts. I am the user of CephFS, and would like to use the persist memory to accelerate file IO and I found long times ago, the FSCache supports the CephFS:
https://lwn.net/Articles/564294/

I wonder if the FSCache support the user mode CephFS accessing? Because I just see there is only kernel code update, this is might the easy question for you.

Thanks

Regards
Lifeng
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

