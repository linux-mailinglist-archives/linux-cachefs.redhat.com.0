Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2566F274394
	for <lists+linux-cachefs@lfdr.de>; Tue, 22 Sep 2020 15:56:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-zqsDL_hYNxS9v-SaTV-wTw-1; Tue, 22 Sep 2020 09:56:15 -0400
X-MC-Unique: zqsDL_hYNxS9v-SaTV-wTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8257CEDA61;
	Tue, 22 Sep 2020 13:56:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9585673684;
	Tue, 22 Sep 2020 13:56:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41C7F18A0C24;
	Tue, 22 Sep 2020 13:56:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MDqYnG026911 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 09:52:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E30E0201EB53; Tue, 22 Sep 2020 13:52:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCDA0201EA97
	for <linux-cachefs@redhat.com>; Tue, 22 Sep 2020 13:52:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 718FC80096B
	for <linux-cachefs@redhat.com>; Tue, 22 Sep 2020 13:52:31 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2107.outbound.protection.outlook.com [40.107.236.107])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-459-6l3MKxCIOwaPiGdTUFEfHw-1; Tue, 22 Sep 2020 09:52:28 -0400
X-MC-Unique: 6l3MKxCIOwaPiGdTUFEfHw-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3326.namprd13.prod.outlook.com (2603:10b6:208:15a::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.8;
	Tue, 22 Sep 2020 13:52:26 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39%6]) with mapi id 15.20.3412.020;
	Tue, 22 Sep 2020 13:52:26 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "daire@dneg.com"
	<daire@dneg.com>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR1/IOmk+iFWQowA=
Date: Tue, 22 Sep 2020 13:52:25 +0000
Message-ID: <ecd78fe32a1d5a3c6cf3c5a77b1841293b3f5cb1.camel@hammerspace.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
In-Reply-To: <1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d960834-834b-4b18-718a-08d85efebd5a
x-ms-traffictypediagnostic: MN2PR13MB3326:
x-microsoft-antispam-prvs: <MN2PR13MB33268A3DD71CE85DE43E5FF4B83B0@MN2PR13MB3326.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I9YlHPxJlaDgn5VTZ01fSl7MWbogWeevH9P2s7QaZm0K6sRlmYUAOhCCeV/MJDMTiPyFnK8tUkTsSu8p8PTs9iCuwNdW6R2bTEF4FGN85XMDvLwgjnRfUC3swz7fEnVbUezYzmydu3/KPGtkXvxSP3HdvcZm6IfKJ7Tgokhr1f0MoD2hIn916lCBFt77C/zeSGAdSQ5eOyuF6OshBSBe0Jk1leZBElGddu2+u+9yjT/DvD1DfooVA/bsDFnOzrE007I7+3OrA8tdpwIaZeYZqARUvd/CtumtwH4Gl588HDwoBo1pV0eT1yeHFZnSiodFGmiwZXNjQB5lYtVgcNnJUGdIXUXlQVjsQbro1MA/bjETiiclUkecsylCVhu6DKRR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(376002)(346002)(39840400004)(366004)(396003)(66446008)(66946007)(91956017)(6512007)(8936002)(186003)(6486002)(26005)(8676002)(76116006)(316002)(5660300002)(2906002)(478600001)(66476007)(64756008)(66556008)(2616005)(110136005)(83380400001)(53546011)(6506007)(71200400001)(86362001)(4326008)(36756003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: eVWbm2Xl7gj6BpVEk8P80pP8Gz/7XA0NJERM5veIXIL8nxjdecQ3659Ea4JvYu9l4RYr8Zw2mwdd/ABnqJsFfxPwcYx8ETahLLSblp6BybpaG55juqS7avY5nBPNPjuLhfanOqvSkIfvUBAQ4DMDAo67TssYZDI/vkttUgBYGwGISXAfFUZVZxH90eIHDiK6fRvsMtEecj5K8YMXsRlGwYpO7nEMtoM7niBuG2FgcepTdy8soLggPqzIhAAqVyKQD6/zrG8aiD3ey8VpAT8K1YaBS9C9kiZnwcbBrbRooFXKh7Kdw4AmxoSOVWLYinVGA281Z5gIkRCS9OJ96y78ishLOaLRqFDoy7NSY79GM0y+e+EHecHoXTCsqM53cvUIiLSykp69Dch9PNf4FRRFzQRUDdnpKABTBJTE4MWnP/XU+eQXxNaobfQh6m4LSgpN18Xyzwln7RoHrgSRIe8L9sIcj8PrQ8YZ3VdDOuOV5lIlj7/CCiYJ3S/VhduoyLFfXBqs1/wqZ2hgza6hYgyz4fp0ujFC1/FffQsr7WKMsXXaavl7LQ+UB9GQ5wpHrGTMl+xcqzOPsGdAz8ao3wBvYak1Dh0zNiK3da1zHY864jEfbkHOO2qAEKN520iNioyJ9rHFGwUqgQrUIy8x6svDRQ==
x-ms-exchange-transport-forked: True
Content-ID: <DDD5AAE8460C654A8119C3E9E01651BE@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d960834-834b-4b18-718a-08d85efebd5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 13:52:26.0448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFnL6RWd4lfQxxMYz1PndGL9+tvGdAvDo4Pfyl4NUVfSh32S6uGzI64oI9E2jmHuM/OKG2NJfoRQ1PlUsasCBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3326
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08MDqYnG026911
X-loop: linux-cachefs@redhat.com
Cc: "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> Hi, 
> 
> I just thought I'd flesh out the other two issues I have found with
> re-exporting that are ultimately responsible for the biggest
> performance bottlenecks. And both of them revolve around the caching
> of metadata file lookups in the NFS client.
> 
> Especially for the case where we are re-exporting a server many
> milliseconds away (i.e. on-premise -> cloud), we want to be able to
> control how much the client caches metadata and file data so that
> it's many LAN clients all benefit from the re-export server only
> having to do the WAN lookups once (within a specified coherency
> time).
> 
> Keeping the file data in the vfs page cache or on disk using
> fscache/cachefiles is fairly straightforward, but keeping the
> metadata cached is particularly difficult. And without the cached
> metadata we introduce long delays before we can serve the already
> present and locally cached file data to many waiting clients.
> 
> ----- On 7 Sep, 2020, at 18:31, Daire Byrne daire@dneg.com wrote:
> > 2) If we cache metadata on the re-export server using
> > actimeo=3600,nocto we can
> > cut the network packets back to the origin server to zero for
> > repeated lookups.
> > However, if a client of the re-export server walks paths and memory
> > maps those
> > files (i.e. loading an application), the re-export server starts
> > issuing
> > unexpected calls back to the origin server again,
> > ignoring/invalidating the
> > re-export server's NFS client cache. We worked around this this by
> > patching an
> > inode/iversion validity check in inode.c so that the NFS client
> > cache on the
> > re-export server is used. I'm not sure about the correctness of
> > this patch but
> > it works for our corner case.
> 
> If we use actimeo=3600,nocto (say) to mount a remote software volume
> on the re-export server, we can successfully cache the loading of
> applications and walking of paths directly on the re-export server
> such that after a couple of runs, there are practically zero packets
> back to the originating NFS server (great!). But, if we then do the
> same thing on a client which is mounting that re-export server, the
> re-export server now starts issuing lots of calls back to the
> originating server and invalidating it's client cache (bad!).
> 
> I'm not exactly sure why, but the iversion of the inode gets changed
> locally (due to atime modification?) most likely via invocation of
> method inode_inc_iversion_raw. Each time it gets incremented the
> following call to validate attributes detects changes causing it to
> be reloaded from the originating server.
> 
> This patch helps to avoid this when applied to the re-export server
> but there may be other places where this happens too. I accept that
> this patch is probably not the right/general way to do this, but it
> helps to highlight the issue when re-exporting and it works well for
> our use case:
> 
> --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27
> 00:23:03.000000000 +0000
> +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> @@ -1869,7 +1869,7 @@
>  
>         /* More cache consistency checks */
>         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> -               if (!inode_eq_iversion_raw(inode, fattr-
> >change_attr)) {
> +               if (inode_peek_iversion_raw(inode) < fattr-
> >change_attr) {
>                         /* Could it be a race with writeback? */
>                         if (!(have_writers || have_delegation)) {
>                                 invalid |= NFS_INO_INVALID_DATA


There is nothing in the base NFSv4, and NFSv4.1 specs that allow you to
make assumptions about how the change attribute behaves over time.

The only safe way to do something like the above is if the server
supports NFSv4.2 and also advertises support for the 'change_attr_type'
attribute. In that case, you can check at mount time for whether or not
the change attribute on this filesystem is one of the monotonic types
which would allow the above optimisation.


-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

