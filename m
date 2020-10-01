Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7A27427FF51
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Oct 2020 14:38:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-Wf6f10OlNfW13gaJf7ZB4Q-1; Thu, 01 Oct 2020 08:38:52 -0400
X-MC-Unique: Wf6f10OlNfW13gaJf7ZB4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 014DD186DD27;
	Thu,  1 Oct 2020 12:38:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92B8010013C1;
	Thu,  1 Oct 2020 12:38:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAC5944A57;
	Thu,  1 Oct 2020 12:38:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091Ccf9k015261 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 08:38:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B02E9202278D; Thu,  1 Oct 2020 12:38:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6AE201EA97
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 12:38:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449B980029D
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 12:38:39 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2139.outbound.protection.outlook.com [40.107.243.139])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-157-beHIDI_XN0m-NjWj7Go_8A-1; Thu, 01 Oct 2020 08:38:37 -0400
X-MC-Unique: beHIDI_XN0m-NjWj7Go_8A-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3070.namprd13.prod.outlook.com (2603:10b6:208:151::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.19;
	Thu, 1 Oct 2020 12:38:35 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39%6]) with mapi id 15.20.3433.037;
	Thu, 1 Oct 2020 12:38:35 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "jlayton@kernel.org" <jlayton@kernel.org>, "daire@dneg.com"
	<daire@dneg.com>
Thread-Topic: [Linux-cachefs] Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR1/IOmk+iGKBtwAACb+DgAAV5C4AAARFAIA=
Date: Thu, 1 Oct 2020 12:38:34 +0000
Message-ID: <7cdb496a2b77dd62b8e6373c28926f11a4816d49.camel@hammerspace.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<97eff1ee2886c14bcd7972b17330f18ceacdef78.camel@kernel.org>
	<1309604906.55950004.1601510969548.JavaMail.zimbra@dneg.com>
	<3243730b0661de0ac0864a9bb5375f894b266220.camel@kernel.org>
In-Reply-To: <3243730b0661de0ac0864a9bb5375f894b266220.camel@kernel.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c01faf9-1a80-4e68-c5c1-08d86606e9bf
x-ms-traffictypediagnostic: MN2PR13MB3070:
x-microsoft-antispam-prvs: <MN2PR13MB3070B49F749874A40CBF0570B8300@MN2PR13MB3070.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 4tCt+gIVRJKjDklhWxaWPQ/AacG/VGqZNljAJaG8Eq8UuBJzNetxj2o6xvgSOyfNdUWo4wIBnQcmq5oiqi53X384ZAPBtsVezq0KwYKe8FIaG0smQU5MiKRYzf8r1weLZDgNwqO3RkdjTay+uOVhhAugTWXRJfbSDS/jsiamf5wi94+keEdqYtKraCPl42ol91a37hlJ44wPB9mnaZ7HI99GOxcLDkdpCx/mcUrZiT1EpgKTqG908UbjK45INnBPgfvJ+vO5DwYq2VpimU3NaYcDUHDMkUjUFO3nqS7mHQ31fSVnMPMSmqJFxOOVe2RY9wrl0MCmpZ78z43LUeTI2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(136003)(39830400003)(366004)(346002)(396003)(4326008)(8936002)(6512007)(86362001)(66556008)(64756008)(316002)(26005)(6486002)(83380400001)(186003)(8676002)(2616005)(54906003)(66446008)(478600001)(66476007)(53546011)(6506007)(91956017)(5660300002)(76116006)(2906002)(36756003)(110136005)(71200400001)(66946007);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: Wi9Eg9Mmbcxfdb0Qg1B70dR/K+EmIwhHa3tiqk2fW2odS6hL70w3VHrdhT0vK3MqNA1W/UareHj8l7k3L2PVKeGVpBiNhzdngSHlkhEHIeP5dES7moAereMc4fxqbSHCzFARxH5cGvIGtNpTj2/37bQxJT77S/QYackwFhjleTNbHpAeqtsZvLiChpTXZI93JlfZZFxSbRPPtn0uYM4l/7GhbBeXmOnLjGqkx08uTFGudlSZ1hNqVJiZOh068qeyjtnqZPjg1ybX7QXYtb21hI2cwyogoEGdjmwIgUZ2uKLPnn9mZWy3g98/rOitfuB7hQEs7wxynKXV/YZ48ZGNJUmnhBVE8dKImNyNZ1HN6pmTtBPF5Wjq9Y+7f2wadlspogh7TyJuQA6GCJsdoGGJ7f90PMi8hksne2d6Ng/i2sVgobuTD2BcNQatu3Yp+SK+EfO2mrepGT/9XnKWPzm1pccJn2mVdObEOZJ5hC2YV7rvGwkPI6QNDbMCl1fXrKg38LmxQVc+mshwe7aw1tU4m9YUXaOwnJ860O3cOJHCJlc54Ir12b/W6ToMX//BPj/jhox7W53+T7ybzOHEJjHThNk4S/qncavcsJwy3V9Yw8fzuN3uMYsOu9gcEq+Cz42mu3R4PTW5JWYtPPicUBOACA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c01faf9-1a80-4e68-c5c1-08d86606e9bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 12:38:34.9565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmK2gsmwj236PVUiWxN75Uo28fSQOBgwAgu2/Dt22TYInno6iy0T3geuQya8uI5iHm6YP0419wOWJZuZqJ9Zpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3070
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 091Ccf9k015261
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <DC2F87765C08314CB92A66E022148FE0@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-01 at 06:36 -0400, Jeff Layton wrote:
> On Thu, 2020-10-01 at 01:09 +0100, Daire Byrne wrote:
> > ----- On 30 Sep, 2020, at 20:30, Jeff Layton jlayton@kernel.org
> > wrote:
> > 
> > > On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> > > > Hi,
> > > > 
> > > > I just thought I'd flesh out the other two issues I have found
> > > > with re-exporting
> > > > that are ultimately responsible for the biggest performance
> > > > bottlenecks. And
> > > > both of them revolve around the caching of metadata file
> > > > lookups in the NFS
> > > > client.
> > > > 
> > > > Especially for the case where we are re-exporting a server many
> > > > milliseconds
> > > > away (i.e. on-premise -> cloud), we want to be able to control
> > > > how much the
> > > > client caches metadata and file data so that it's many LAN
> > > > clients all benefit
> > > > from the re-export server only having to do the WAN lookups
> > > > once (within a
> > > > specified coherency time).
> > > > 
> > > > Keeping the file data in the vfs page cache or on disk using
> > > > fscache/cachefiles
> > > > is fairly straightforward, but keeping the metadata cached is
> > > > particularly
> > > > difficult. And without the cached metadata we introduce long
> > > > delays before we
> > > > can serve the already present and locally cached file data to
> > > > many waiting
> > > > clients.
> > > > 
> > > > ----- On 7 Sep, 2020, at 18:31, Daire Byrne daire@dneg.com
> > > > wrote:
> > > > > 2) If we cache metadata on the re-export server using
> > > > > actimeo=3600,nocto we can
> > > > > cut the network packets back to the origin server to zero for
> > > > > repeated lookups.
> > > > > However, if a client of the re-export server walks paths and
> > > > > memory maps those
> > > > > files (i.e. loading an application), the re-export server
> > > > > starts issuing
> > > > > unexpected calls back to the origin server again,
> > > > > ignoring/invalidating the
> > > > > re-export server's NFS client cache. We worked around this
> > > > > this by patching an
> > > > > inode/iversion validity check in inode.c so that the NFS
> > > > > client cache on the
> > > > > re-export server is used. I'm not sure about the correctness
> > > > > of this patch but
> > > > > it works for our corner case.
> > > > 
> > > > If we use actimeo=3600,nocto (say) to mount a remote software
> > > > volume on the
> > > > re-export server, we can successfully cache the loading of
> > > > applications and
> > > > walking of paths directly on the re-export server such that
> > > > after a couple of
> > > > runs, there are practically zero packets back to the
> > > > originating NFS server
> > > > (great!). But, if we then do the same thing on a client which
> > > > is mounting that
> > > > re-export server, the re-export server now starts issuing lots
> > > > of calls back to
> > > > the originating server and invalidating it's client cache
> > > > (bad!).
> > > > 
> > > > I'm not exactly sure why, but the iversion of the inode gets
> > > > changed locally
> > > > (due to atime modification?) most likely via invocation of
> > > > method
> > > > inode_inc_iversion_raw. Each time it gets incremented the
> > > > following call to
> > > > validate attributes detects changes causing it to be reloaded
> > > > from the
> > > > originating server.
> > > > 
> > > 
> > > I'd expect the change attribute to track what's in actual inode
> > > on the
> > > "home" server. The NFS client is supposed to (mostly) keep the
> > > raw
> > > change attribute in its i_version field.
> > > 
> > > The only place we call inode_inc_iversion_raw is in
> > > nfs_inode_add_request, which I don't think you'd be hitting
> > > unless you
> > > were writing to the file while holding a write delegation.
> > > 
> > > What sort of server is hosting the actual data in your setup?
> > 
> > We mostly use RHEL7.6 NFS servers with XFS backed filesystems and a
> > couple of (older) Netapps too. The re-export server is running the
> > latest mainline kernel(s).
> > 
> > As far as I can make out, both these originating (home) server
> > types exhibit a similar (but not exactly the same) effect on the
> > Linux NFS client cache when it is being re-exported and accessed by
> > other clients. I can replicate it when only using a read-only mount
> > at every hop so I don't think that writes are related.
> > 
> > Our RHEL7 NFS servers actually mount XFS with noatime too so any
> > atime updates that might be causing this client invalidation (which
> > is what I initially thought) are ultimately a wasted effort.
> > 
> 
> Ok. I suspect there is a bug here somewhere, but with such a
> complicated
> setup though it's not clear to me where that bug would be though. You
> might need to do some packet sniffing and look at what the servers
> are
> sending for change attributes.
> 
> nfsd4_change_attribute does mix in the ctime, so your hunch about the
> atime may be correct. atime updates imply a ctime update and that
> could
> cause nfsd to continually send a new one, even on files that aren't
> being changed.

No. Ordinary atime updates due to read() do not trigger a ctime or
change attribute update. Only an explicit atime update through, e.g. a
call to utimensat() will do that.

> 
> It might be interesting to doctor nfsd4_change_attribute() to not mix
> in
> the ctime and see whether that improves things. If it does, then we
> may
> want to teach nfsd how to avoid doing that for certain types of
> filesystems.

NACK. That would cause very incorrect behaviour for the change
attribute. It is supposed to change in all circumstances where you
ordinarily see a ctime change.

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

