Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 974BA26AE4E
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Sep 2020 21:59:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-VpVuWRl-PcuhvQdIzM7iMA-1; Tue, 15 Sep 2020 15:59:46 -0400
X-MC-Unique: VpVuWRl-PcuhvQdIzM7iMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 693CF1021215;
	Tue, 15 Sep 2020 19:59:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C2411002D69;
	Tue, 15 Sep 2020 19:59:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1833218338EF;
	Tue, 15 Sep 2020 19:59:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FJxbrM019889 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 15:59:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 154251007A27; Tue, 15 Sep 2020 19:59:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F6DA10087C8
	for <linux-cachefs@redhat.com>; Tue, 15 Sep 2020 19:59:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97E38101A568
	for <linux-cachefs@redhat.com>; Tue, 15 Sep 2020 19:59:34 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2105.outbound.protection.outlook.com [40.107.243.105])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-u7_0dmJ8M4umNnt806kxoA-1; Tue, 15 Sep 2020 15:59:31 -0400
X-MC-Unique: u7_0dmJ8M4umNnt806kxoA-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3101.namprd13.prod.outlook.com (2603:10b6:208:155::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5;
	Tue, 15 Sep 2020 19:59:27 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39%7]) with mapi id 15.20.3370.016;
	Tue, 15 Sep 2020 19:59:27 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>, "daire@dneg.com"
	<daire@dneg.com>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR4tJDJwAAAWCe4A=
Date: Tue, 15 Sep 2020 19:59:27 +0000
Message-ID: <4d1d7cd0076d98973a56e89c92e4ff0474aa0e14.camel@hammerspace.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
In-Reply-To: <20200915172140.GA32632@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74991891-e3d9-4f3a-3c9e-08d859b1da0c
x-ms-traffictypediagnostic: MN2PR13MB3101:
x-microsoft-antispam-prvs: <MN2PR13MB3101B9208B2CF024ECFB6E99B8200@MN2PR13MB3101.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNho3ZrYTjkTDmhLYqnNW8Oo8pknaxxxKAWuEohIcFNKeWGRDXY8HPGrOyhHrrIVynx3ErOnxuVcUnkVq4yrxBz83q4W8IwjIIF4oSLMeCJ+qLjhSZwcWQfhF2yHNt1d9k9ELHREdPtiGzBBsab+Acg7E50IYD9BBTUu6WGuA0PiVoQTCys0xqPlXe7JEmFmMdk+JztTG1Bn2FCOkBM1dFcbanVyrBSYC4yr96j3SYRZUb5S+phXpqriJs3aDzvz4GhDYFlLJp0Ej+btlqGAEu9NPeYv4qWb2G0biyiYqKF9j8HTw4R2EHf6d9GEumJ7QGS9KcW0rbwrO6YTUvlYgQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(396003)(39840400004)(376002)(136003)(346002)(366004)(66476007)(66556008)(64756008)(66446008)(26005)(5660300002)(83380400001)(6486002)(186003)(316002)(8676002)(6512007)(8936002)(478600001)(6506007)(86362001)(2906002)(54906003)(4326008)(36756003)(110136005)(66946007)(71200400001)(91956017)(76116006)(2616005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: R6Y8iJ040w29ASrlwu8/bnqCwolPxe5G7jquEUIRIzcQtmLlJbLYDY8XRrX2TDS8VDOtQrwgIVeM7DpnYITlGzGvWEUAUAggHxi8QfldzbypU9673AJLYOUIVAcSnL5yhD/MxkAnbt+j+eIqhjhDtRWXcia4XFlAp0mJFMF10f7qqecjJ+T3RFOOEqPpB3qE0N7rwX2N2r+Id4JpIEdsHUEtdW5xmGgDPENyiQ9QMxg0+g85wUrM3nKjfQkJVkufBqh4+MuqgyWgbafcawl0x7BRjDhmB8fOoMfsLIJWft3akOeRiwhI4uQ/8kfvvCI1B5Nk1CTQCv5ARqKod8cfJ+E+0059hnvh9wFzqT+wvqiNXw2LE7BRPWRpOIqOXZ7ogDfXcAoEmyvOlgTpX+iUVRazJhsHp7kioP0bIov2DCu5NXeFuRlWL23hf23mBw11Be7lBXgTTbpNX/B9JO2M/eR7fNS8fB66pPLHUHwm6ioC3OpUaZKEpT8WzjaYH1TlCuh59XS+ravO4F6FAPUJ4sRQwxtYW+AZYM2l8xT+x9P8Pi5RzSLMW7XqArFtKi4NiTBLIkdP912qvOE8b9bh991ZpgVY47u9l6+4RYq/22vz+AHVRah5SNSXQcnrYgojWjNEusj5zrvuhgh8hQQQLA==
x-ms-exchange-transport-forked: True
Content-ID: <162A84E918D2E346BA691A563350C1CE@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74991891-e3d9-4f3a-3c9e-08d859b1da0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 19:59:27.2326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jsrfoJ6/ezCjLUgGzv4tKgR0gfc1ThrLNko7iYrEXd1IODHpUhGqkq1t4ehuZcb3yzHakMJC2NJ0jD34YSUzpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3101
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08FJxbrM019889
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On Tue, 2020-09-15 at 13:21 -0400, J. Bruce Fields wrote:
> On Mon, Sep 07, 2020 at 06:31:00PM +0100, Daire Byrne wrote:
> > 1) The kernel can drop entries out of the NFS client inode cache
> > (under memory cache churn) when those filehandles are still being
> > used by the knfsd's remote clients resulting in sporadic and random
> > stale filehandles. This seems to be mostly for directories from
> > what I've seen. Does the NFS client not know that knfsd is still
> > using those files/dirs? The workaround is to never drop inode &
> > dentry caches on the re-export servers (vfs_cache_pressure=1). This
> > also helps to ensure that we actually make the most of our
> > actimeo=3600,nocto mount options for the full specified time.
> 
> I thought reexport worked by embedding the original server's
> filehandles
> in the filehandles given out by the reexporting server.
> 
> So, even if nothing's cached, when the reexporting server gets a
> filehandle, it should be able to extract the original filehandle from
> it
> and use that.
> 
> I wonder why that's not working?

NFSv3? If so, I suspect it is because we never wrote a lookupp()
callback for it.

> 
> > 4) With an NFSv4 re-export, lots of open/close requests (hundreds
> > per
> > second) quickly eat up the CPU on the re-export server and perf top
> > shows we are mostly in native_queued_spin_lock_slowpath.
> 
> Any statistics on who's calling that function?
> 
> > Does NFSv4
> > also need an open file cache like that added to NFSv3? Our
> > workaround
> > is to either fix the thing doing lots of repeated open/closes or
> > use
> > NFSv3 instead.
> 
> NFSv4 uses the same file cache.  It might be the file cache that's at
> fault, in fact....
> 
> --b.
-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

