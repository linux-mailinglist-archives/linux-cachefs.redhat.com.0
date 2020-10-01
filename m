Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 753F62807B2
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Oct 2020 21:24:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-VRgK-SU_OrS6LmpWvLWmEg-1; Thu, 01 Oct 2020 15:24:55 -0400
X-MC-Unique: VRgK-SU_OrS6LmpWvLWmEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BCD1800461;
	Thu,  1 Oct 2020 19:24:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAED510016DA;
	Thu,  1 Oct 2020 19:24:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B64C1826D2E;
	Thu,  1 Oct 2020 19:24:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091JOmVc012534 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 15:24:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B371410FABF; Thu,  1 Oct 2020 19:24:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE4510F03B
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:24:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9527101A56A
	for <linux-cachefs@redhat.com>; Thu,  1 Oct 2020 19:24:46 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-518-CEDGBv1CPVa-F1gaeaonSA-1; Thu, 01 Oct 2020 15:24:44 -0400
X-MC-Unique: CEDGBv1CPVa-F1gaeaonSA-1
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
	by MN2PR13MB3837.namprd13.prod.outlook.com (2603:10b6:208:19f::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.22;
	Thu, 1 Oct 2020 19:24:42 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39]) by
	MN2PR13MB3957.namprd13.prod.outlook.com
	([fe80::e8a1:6acc:70f0:ef39%6]) with mapi id 15.20.3433.037;
	Thu, 1 Oct 2020 19:24:42 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: "bfields@fieldses.org" <bfields@fieldses.org>, "jlayton@kernel.org"
	<jlayton@kernel.org>
Thread-Topic: [Linux-cachefs] Adventures in NFS re-exporting
Thread-Index: fNDm/l4o9cYx5Rz5g0S1EO4zMAtIR1/IOmk+iGKBtwAAMJPuAAABg7oA
Date: Thu, 1 Oct 2020 19:24:42 +0000
Message-ID: <1424d45ba1d140bfcff4ae834c70b0a79daa6807.camel@hammerspace.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<1155061727.42788071.1600777874179.JavaMail.zimbra@dneg.com>
	<97eff1ee2886c14bcd7972b17330f18ceacdef78.camel@kernel.org>
	<20201001184118.GE1496@fieldses.org>
In-Reply-To: <20201001184118.GE1496@fieldses.org>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df3cf789-4eae-47ce-e960-08d8663fa5de
x-ms-traffictypediagnostic: MN2PR13MB3837:
x-microsoft-antispam-prvs: <MN2PR13MB38377B6133E3262CE9478D90B8300@MN2PR13MB3837.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: zN7lfOtO+AQs5yLnCLD+3MMQfpYOJdqeMAEJdrUJ49ZCufnkm7nDEc8LGG5n5YER04KNipBvGU87rpndbmvgM5Zormkh6hU9EzIsLGazzpmJVmq7FT9ob2RGPBqi7Qw9EhbFKe0DSVcJ3svOb6aH24tQmReSwys1rMZhAwrpYNVz9m5YxdOpp30n1eHH+7j8aqvr+XcuxaRiwyvMgh2r5pza3rHLoz0mKXwDIvFAtZUoFRqeQQvS0JqZN9uqJONnykLs/cGR6AW72/vaq9Yiuy6HizjnN8Z3l1aCmKTXSnks8u7gkOJVNEvZdFkF9Yh0P87aF6zVHIffZVLhHC2ZGQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MN2PR13MB3957.namprd13.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39840400004)(346002)(136003)(376002)(366004)(396003)(8676002)(8936002)(66556008)(66476007)(91956017)(66946007)(66446008)(64756008)(2906002)(76116006)(36756003)(316002)(54906003)(71200400001)(5660300002)(110136005)(186003)(6512007)(2616005)(26005)(83380400001)(4326008)(6506007)(6486002)(86362001)(478600001);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: rOWo/aTR+4Ym2xZakyzWaAiFpcRETfaF65fqdDq3Atv/Po/yJOn3xhdL2a+lMJW8Dit+VtLZ3IwOc6koikC22Lif5rP46ebtWBX/royEpX+q7XwphXQwN1hNtKaRA2/Mrd0Pr8eAk8oKYImaGU60tA3y8Jjq4huBf4dURg7G5x/jQGRIV2Q574IJ8PsQ5j4tkhOOnC37RMa2TZb8Agvm4wKD4C093HjrNUv40wkFsN0sahtfOXzz+T5/dyVKg3DrIXOTQQ6NQw8FlHf0MMVwMhQztDcgaqSWERi0LQRnCqgVwR3+oygoFG2mgtwi+viiriur0GVd7dJRSyVcH3i9W3NnhErFdT2JuGJRTepw2GdYW8xG+Rb4RigbvdCIW11ZBFcE3CMGfJkBuAT+Hw2CW3bkT1rSHeaELUqhT1+WwZa3dY6wZ+8zdL9XsmpM7nJlmDZ0fHnk2jnytzpXSHWwQ1B1551f9NX1ih2Zv1vmCo+kynrBVuugD6ZrIr8yeyTKQw3yN4JfVsQ8Ql8G2/1a8JfDrlR82osJPxMB8QRRhr7VRTRRS14OjA+oEG6MRWUOFvefMggurGLJfPQsQYoxpwNDDCK5l0EjRebTk39nTSjqhbqiFaBlef1tO7c0k/T62q+f03AdBqdJa/bXga/b4A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3cf789-4eae-47ce-e960-08d8663fa5de
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 19:24:42.2795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axcQaxSDa6Qf39SkeptwVRvzGZCcOwd5ETEPAALDBruNCxxWQYp2SXuyqkgqdXq/crDmQkmbgsnNfH25dmr1mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB3837
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 091JOmVc012534
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
Content-Language: en-US
Content-ID: <192A802A997A5747B3AAEDB0ED10B146@namprd13.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-01 at 14:41 -0400, J. Bruce Fields wrote:
> On Wed, Sep 30, 2020 at 03:30:22PM -0400, Jeff Layton wrote:
> > On Tue, 2020-09-22 at 13:31 +0100, Daire Byrne wrote:
> > > This patch helps to avoid this when applied to the re-export
> > > server but there may be other places where this happens too. I
> > > accept that this patch is probably not the right/general way to
> > > do this, but it helps to highlight the issue when re-exporting
> > > and it works well for our use case:
> > > 
> > > --- linux-5.5.0-1.el7.x86_64/fs/nfs/inode.c     2020-01-27
> > > 00:23:03.000000000 +0000
> > > +++ new/fs/nfs/inode.c  2020-02-13 16:32:09.013055074 +0000
> > > @@ -1869,7 +1869,7 @@
> > >  
> > >         /* More cache consistency checks */
> > >         if (fattr->valid & NFS_ATTR_FATTR_CHANGE) {
> > > -               if (!inode_eq_iversion_raw(inode, fattr-
> > > >change_attr)) {
> > > +               if (inode_peek_iversion_raw(inode) < fattr-
> > > >change_attr) {
> > >                         /* Could it be a race with writeback? */
> > >                         if (!(have_writers || have_delegation)) {
> > >                                 invalid |= NFS_INO_INVALID_DATA
> > > 
> > > With this patch, the re-export server's NFS client attribute
> > > cache is maintained and used by all the clients that then mount
> > > it. When many hundreds of clients are all doing similar things at
> > > the same time, the re-export server's NFS client cache is
> > > invaluable in accelerating the lookups (getattrs).
> > > 
> > > Perhaps a more correct approach would be to detect when it is
> > > knfsd that is accessing the client mount and change the cache
> > > consistency checks accordingly? 
> > 
> > Yeah, I don't think you can do this for the reasons Trond outlined.
> 
> I'm not clear whether Trond thought that knfsd's behavior in the case
> it
> returns NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR might be good enough to
> allow
> this or some other optimization.
> 

NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR should normally be good enough to
allow the above optimisation, yes. I'm less sure about whether or not
we are correct in returning NFS4_CHANGE_TYPE_IS_MONOTONIC_INCR when in
fact we are adding the ctime and filesystem-specific change attribute,
but we could fix that too.

-- 
Trond Myklebust
Linux NFS client maintainer, Hammerspace
trond.myklebust@hammerspace.com



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

