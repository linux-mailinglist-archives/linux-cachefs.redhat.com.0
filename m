Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE64275872
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Sep 2020 15:13:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-568WwBM8ORagtL9XjnAL9g-1; Wed, 23 Sep 2020 09:12:59 -0400
X-MC-Unique: 568WwBM8ORagtL9XjnAL9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A83F38ECE40;
	Wed, 23 Sep 2020 13:12:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D80100164C;
	Wed, 23 Sep 2020 13:12:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F7D2183D041;
	Wed, 23 Sep 2020 13:12:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ND9AGf010167 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 09:09:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 865542166B28; Wed, 23 Sep 2020 13:09:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 808A62156A23
	for <linux-cachefs@redhat.com>; Wed, 23 Sep 2020 13:09:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2288C803523
	for <linux-cachefs@redhat.com>; Wed, 23 Sep 2020 13:09:08 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750094.outbound.protection.outlook.com [40.107.75.94])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-6f0Y8-1jM0-0B-8Umsi3fA-1; Wed, 23 Sep 2020 09:09:05 -0400
X-MC-Unique: 6f0Y8-1jM0-0B-8Umsi3fA-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3807.namprd13.prod.outlook.com (2603:10b6:208:1eb::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.13;
	Wed, 23 Sep 2020 13:09:01 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39%6]) with mapi id 15.20.3433.013;
	Wed, 23 Sep 2020 13:09:01 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR1/IOmk+iFWQowAAL8j+AAAA/XiA
Date: Wed, 23 Sep 2020 13:09:01 +0000
Message-ID: <a47553497db7c9ae9f68cbe703a12a4e4051aef2.camel@hammerspace.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<ecd78fe32a1d5a3c6cf3c5a77b1841293b3f5cb1.camel@hammerspace.com>
	<20200923124038.GA4691@fieldses.org>
In-Reply-To: <20200923124038.GA4691@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85bae308-f96c-46db-c8a1-08d85fc1d6fd
x-ms-traffictypediagnostic: MN2PR13MB3807:
x-microsoft-antispam-prvs: <MN2PR13MB3807B19F83A89EE80B9E415EB8380@MN2PR13MB3807.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 97JW/pYNLqaODPnaxe0pSToMa7ojUuk5iwR+Esd0N4S+stPoCkqrumBusjLXzqR6QD+4MTwBXqU8/cj8hZ7n8GwjVc4BkOQOyFkKYRd5f2wJV6Dpb2RT8Tt/FhA4jC4Wi3dSk5s5g/eFGulj7FLKtfiIepVvaih43EAZdsNoVRCGWjAGU6srmzgnwqoe/3pMa4YahjNN0x2sWEkWVmGD1ApAuzmPA7vUoOPSRMRB/DkVw8ejLE/5el91IsCVv/h8d0hXeKwB3H0Vj+ZgXpDzw5QSc6t5mI9M2+9JBHw8MOMmYE2/tz0Lx/VAllX1up1fkriDH49W+jV6CM28QZvnF7VfDwzlFRS6ey3C8MKK4Fim2Ut7N9IsO6WPpmIqaQDondxqTihcHfBByr5McGvFMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(136003)(346002)(396003)(39830400003)(376002)(966005)(54906003)(2906002)(66946007)(66476007)(66556008)(91956017)(76116006)(36756003)(316002)(2616005)(71200400001)(186003)(478600001)(6512007)(83080400001)(83380400001)(4326008)(5660300002)(6916009)(6486002)(64756008)(8676002)(26005)(66446008)(8936002)(6506007)(53546011)(86362001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 8hP3rwmcJFNL8jVhb4t9pjxZ8Cw1MbEvHBFutNcKXM6DU5aJVGZcv5zEgoDomsgDbV/p2RiYmdxNCbIClAV1Q2xF/GZZ2Hi+A0QE+1SSzvIb6FjZhC8qWJSn/FW/UuBSuB21+6zV+MZ3wHVOPbEBA/CgAskIRMwzDMl/KG+LjcFx7zu0mnufBPe5c3Vk7XoSFpslolGC+j7Z8pQLpyAykUW6Lr+I5M4Faw71TwkSvBmcAigDTW4NGlNpHhhC+VwRZs1iIhdkmQpEMCKp13pQ1YNglCBygvmHxXNjqdRkrORngL266f5qWPTeQ7chaQGiIhlPm9RU0I7HR8dh8LCMm2vBTkrbNdPLNe2OY5ieevALh8AhsVVQyafPn6uAj8xtEwjc0hvcE9mYTu5nh0bpbUm4k9lHj5gQM9iioOhDqEPHgKHhGO/0NAIErvyabTSnqi9CgXJBZwD7ZeM5+Cda0232MtUKrQLxAHDJ7nFaEu0i3OfL6ob5bya9L5B+01NlTsv126umcunabT9T7oYQUrEBuRV+fVp/XKCEs/niXbbnlxSqtlU6JZmGnHOUS4J/FSGiocPUmE4lEDHOWC5CgRBsIc67lQkfUzVqBZ395DXfzghLlSwKwCsARjmDDd4oKVYOZ63GsH6HnVW2YzFbiQ==
x-ms-exchange-transport-forked: True
Content-ID: <B6C9BA3F208C8B439457AF7B3062893B@namprd13.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bae308-f96c-46db-c8a1-08d85fc1d6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 13:09:01.1147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Rz8qZaJucsAGpHoaZyHjcq7lfpugChjUKthdvaQTcoFpPw/LqCChAS+6lw1KdY7ozIDN5ssXy6CSoc2uCKXyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3807
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ND9AGf010167
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"daire@dneg.com" <daire@dneg.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On Wed, 2020-09-23 at 08:40 -0400, J. Bruce Fields wrote:
> On Tue, Sep 22, 2020 at 01:52:25PM +0000, Trond Myklebust wrote:
> > On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> > > Hi, 
> > > 
> > > I just thought I'd flesh out the other two issues I have found
> > > with
> > > re-exporting that are ultimately responsible for the biggest
> > > performance bottlenecks. And both of them revolve around the
> > > caching
> > > of metadata file lookups in the NFS client.
> > > 
> > > Especially for the case where we are re-exporting a server many
> > > milliseconds away (i.e. on-premise -> cloud), we want to be able
> > > to
> > > control how much the client caches metadata and file data so that
> > > it's many LAN clients all benefit from the re-export server only
> > > having to do the WAN lookups once (within a specified coherency
> > > time).
> > > 
> > > Keeping the file data in the vfs page cache or on disk using
> > > fscache/cachefiles is fairly straightforward, but keeping the
> > > metadata cached is particularly difficult. And without the cached
> > > metadata we introduce long delays before we can serve the already
> > > present and locally cached file data to many waiting clients.
> > > 
> > > ----- On 7 Sep, 2020, at 18:31, Daire Byrne daire@dneg.com wrote:
> > > > 2) If we cache metadata on the re-export server using
> > > > actimeo=3600,nocto we can
> > > > cut the network packets back to the origin server to zero for
> > > > repeated lookups.
> > > > However, if a client of the re-export server walks paths and
> > > > memory
> > > > maps those
> > > > files (i.e. loading an application), the re-export server
> > > > starts
> > > > issuing
> > > > unexpected calls back to the origin server again,
> > > > ignoring/invalidating the
> > > > re-export server's NFS client cache. We worked around this this
> > > > by
> > > > patching an
> > > > inode/iversion validity check in inode.c so that the NFS client
> > > > cache on the
> > > > re-export server is used. I'm not sure about the correctness of
> > > > this patch but
> > > > it works for our corner case.
> > > 
> > > If we use actimeo=3600,nocto (say) to mount a remote software
> > > volume
> > > on the re-export server, we can successfully cache the loading of
> > > applications and walking of paths directly on the re-export
> > > server
> > > such that after a couple of runs, there are practically zero
> > > packets
> > > back to the originating NFS server (great!). But, if we then do
> > > the
> > > same thing on a client which is mounting that re-export server,
> > > the
> > > re-export server now starts issuing lots of calls back to the
> > > originating server and invalidating it's client cache (bad!).
> > > 
> > > I'm not exactly sure why, but the iversion of the inode gets
> > > changed
> > > locally (due to atime modification?) most likely via invocation
> > > of
> > > method inode_inc_iversion_raw. Each time it gets incremented the
> > > following call to validate attributes detects changes causing it
> > > to
> > > be reloaded from the originating server.
> > > 
> > > This patch helps to avoid this when applied to the re-export
> > > server
> > > but there may be other places where this happens too. I accept
> > > that
> > > this patch is probably not the right/general way to do this, but
> > > it
> > > helps to highlight the issue when re-exporting and it works well
> > > for
> > > our use case:
> > > 
> > > --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27
> > > 00:23:03.000000000 +0000
> > > +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> > > @@ -1869,7 +1869,7 @@
> > >  
> > >         /* More cache consistency checks */
> > >         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> > > -               if (!inode_eq_iversion_raw(inode, fattr-
> > > > change_attr)) {
> > > +               if (inode_peek_iversion_raw(inode) < fattr-
> > > > change_attr) {
> > >                         /* Could it be a race with writeback? */
> > >                         if (!(have_writers || have_delegation)) {
> > >                                 invalid |= NFS_INO_INVALID_DATA
> > 
> > There is nothing in the base NFSv4, and NFSv4.1 specs that allow
> > you to
> > make assumptions about how the change attribute behaves over time.
> > 
> > The only safe way to do something like the above is if the server
> > supports NFSv4.2 and also advertises support for the
> > 'change_attr_type'
> > attribute. In that case, you can check at mount time for whether or
> > not
> > the change attribute on this filesystem is one of the monotonic
> > types
> > which would allow the above optimisation.
> 
> Looking at https://tools.ietf.org/html/rfc7862#section-12.2.3 .... I
> think that would be anything but NFS4_CHANGE_TYPE_IS_UNDEFINED ?
> 
> The Linux server's ctime is monotonic and will advertise that with
> change_attr_type since 4.19.
> 
> So I think it would be easy to patch the client to check
> change_attr_type and set an NFS_CAP_MONOTONIC_CHANGE flag in
> server->caps, the hard part would be figuring out which optimisations
> are OK.
> 

The ctime is *not* monotonic. It can regress under server reboots and
it can regress if someone deliberately changes the time. We have code
that tries to handle all these issues (see fattr->gencount and nfsi-
>attr_gencount) because we've hit those issues before...

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

