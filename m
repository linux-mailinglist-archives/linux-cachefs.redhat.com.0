Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 925522807D1
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Oct 2020 21:35:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-FvruFad3MK2rCmLypCa7fQ-1; Thu, 01 Oct 2020 15:35:53 -0400
X-MC-Unique: FvruFad3MK2rCmLypCa7fQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEE571DE0B;
	Thu,  1 Oct 2020 19:35:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C6D873677;
	Thu,  1 Oct 2020 19:35:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE4CC44A5E;
	Thu,  1 Oct 2020 19:35:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091JTvYQ013032 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 15:29:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 854972156A3C; Thu,  1 Oct 2020 19:29:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D5CE2156A49
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:29:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 743C518A070E
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:29:55 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2130.outbound.protection.outlook.com [40.107.237.130])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-473-bcisaLOvN46tpSuvTwEKtA-1; Thu, 01 Oct 2020 15:29:53 -0400
X-MC-Unique: bcisaLOvN46tpSuvTwEKtA-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3373.namprd13.prod.outlook.com (2603:10b6:208:16a::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.16;
	Thu, 1 Oct 2020 19:29:51 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39%6]) with mapi id 15.20.3433.037;
	Thu, 1 Oct 2020 19:29:51 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Thread-Topic: [Linux-cachefs] Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR1/IOmk+iGKBtwAAMJPuAAABg7oAAAAMOAAAACH6AA==
Date: Thu, 1 Oct 2020 19:29:51 +0000
Message-ID: <a6294c25cb5eb98193f609a52aa8f4b5d4e81279.camel@hammerspace.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<97eff1ee2886c14bcd7972b17330f18ceacdef78.camel@kernel.org>
	<20201001184118.GE1496@fieldses.org>
	<1424d45ba1d140bfcff4ae834c70b0a79daa6807.camel@hammerspace.com>
	<20201001192602.GF1496@fieldses.org>
In-Reply-To: <20201001192602.GF1496@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d333458-aea8-4419-e575-08d866405e26
x-ms-traffictypediagnostic: MN2PR13MB3373:
x-microsoft-antispam-prvs: <MN2PR13MB337386D220ED55B6AA98AAAEB8300@MN2PR13MB3373.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: CQ0WUh2viJDd0H5+16vMihre1CI1uONXQZZ5ch+WOpDmGzhhiwmV/491nTkAmyYmv2OoveTAoBN/sSuUATqWu4rg3kJLcovz+FEs0hss2x8YyZMcqQT8PMptNNNJ/r2CqTNfaP48dN1LjHBJLqLXwr96TOPSSEATxzadBQQy1k5xMQvcNc1wIsRNN7Nk7/Dbojc+msIWrmtSETC5beR/WUlx546RdecBytrPS75rrEeJw/A5F5UP2iOP9QGzmzAW3TogeY/iovbb9uHIrIBXJu4YU0SGLNrWZ+yYBTUuJCfax3DvyqhkrLpiZfJqkBkmisJvWs0fYBD9QSHjgQZiZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(346002)(396003)(136003)(366004)(39840400004)(66446008)(66556008)(66476007)(64756008)(83380400001)(36756003)(2906002)(66946007)(8676002)(86362001)(91956017)(8936002)(6512007)(76116006)(6916009)(26005)(6486002)(6506007)(186003)(71200400001)(2616005)(478600001)(5660300002)(316002)(4326008)(54906003);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: h3ml7Cfvq2vhZ0J28yn4GF9P0CcBo9PgkTPOf7oo5DbXi5jKwRQIUdzcIQC/x7+q8v3Re3Gem8HwkFUCLVjQMEaBhYHVfY0ePzcd7+AzFYsg7KwJZJWR0PQA3OZWKlC8oFidOehK7jXY3/BzE/1xt4PaqEQzrQKsZdftbkBlz2vTDUChl2EmHAwW6o8kUpj7rm04Txj0q7XH6TBVqBdF2MloQCWT/jbjf4iz66fd8WJmYTbD1f58ld9jIXsdeskPclNKpPdfvzZX2Dsx7KAo2xK5Rvwz9yYB8h74LpDFyoNmadCZjuli9p34W5r2W0wbq8qwiEMChp4setm5NuSl/71h7gbjBjVAzeOsqVCVYuKjNoeqURTZgMwfPtSTiJ0VxWNhsoDwiqe/LEHUGK3NgcSNzp1hCV8JPdIUH+RgJ501WgUlmJtS9nQzezH9OyzNuUPwxJGEGaiga5bhqpvVFq3QSXG1MWSaxOi2JSmIDxCmFUcpFzfbg3txFARZMf2RdYr68nxp7BFNtFimihi/UOfz5CV+z5J3wSR0/iKJIkoQMRvCzUb+o09ErXI5jhncwLLxB1GSSgu3L6RTQSkn4dR3d007d/hR+A4lqx3eKcDbWCfwEJyb4ueECb/84oPTY/2U4E71ahoINLIy+QWVUg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d333458-aea8-4419-e575-08d866405e26
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 19:29:51.5327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9E33MaL7hOCe2ZVzfVUEoLjUN5V+jZPVOEQ83YJBLW3UmcmosuAZ6KkWMEITVyPAPh0IYl2FgvQGT0ehAVNAuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3373
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 091JTvYQ013032
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"jlayton@kernel.org" <jlayton@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <4ADE38E92137614485C33ED99D6E56B1@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-01 at 15:26 -0400, bfields@fieldses.org wrote:
> On Thu, Oct 01, 2020 at 07:24:42PM +0000, Trond Myklebust wrote:
> > On Thu, 2020-10-01 at 14:41 -0400, J. Bruce Fields wrote:
> > > On Wed, Sep 30, 2020 at 03:30:22PM -0400, Jeff Layton wrote:
> > > > On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> > > > > This patch helps to avoid this when applied to the re-export
> > > > > server but there may be other places where this happens too.
> > > > > I
> > > > > accept that this patch is probably not the right/general way
> > > > > to
> > > > > do this, but it helps to highlight the issue when re-
> > > > > exporting
> > > > > and it works well for our use case:
> > > > > 
> > > > > --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27
> > > > > 00:23:03.000000000 +0000
> > > > > +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> > > > > @@ -1869,7 +1869,7 @@
> > > > >  
> > > > >         /* More cache consistency checks */
> > > > >         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> > > > > -               if (!inode_eq_iversion_raw(inode, fattr-
> > > > > > change_attr)) {
> > > > > +               if (inode_peek_iversion_raw(inode) < fattr-
> > > > > > change_attr) {
> > > > >                         /* Could it be a race with writeback?
> > > > > */
> > > > >                         if (!(have_writers ||
> > > > > have_delegation)) {
> > > > >                                 invalid |=
> > > > > NFS_INO_INVALID_DATA
> > > > > 
> > > > > With this patch, the re-export server's NFS client attribute
> > > > > cache is maintained and used by all the clients that then
> > > > > mount
> > > > > it. When many hundreds of clients are all doing similar
> > > > > things at
> > > > > the same time, the re-export server's NFS client cache is
> > > > > invaluable in accelerating the lookups (getattrs).
> > > > > 
> > > > > Perhaps a more correct approach would be to detect when it is
> > > > > knfsd that is accessing the client mount and change the cache
> > > > > consistency checks accordingly? 
> > > > 
> > > > Yeah, I don't think you can do this for the reasons Trond
> > > > outlined.
> > > 
> > > I'm not clear whether Trond thought that knfsd's behavior in the
> > > case
> > > it
> > > returns NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR might be good enough
> > > to
> > > allow
> > > this or some other optimization.
> > > 
> > 
> > NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR should normally be good enough
> > to
> > allow the above optimisation, yes. I'm less sure about whether or
> > not
> > we are correct in returning NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR when
> > in
> > fact we are adding the ctime and filesystem-specific change
> > attribute,
> > but we could fix that too.
> 
> Could you explain your concern?
> 

Same as before: that the ctime could cause the value to regress if
someone messes with the system time on the server. Yes, we do add in
the change attribute, but the value of ctime.tv_sec dominates by a
factor 2^30.

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

