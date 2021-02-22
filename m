Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 704E4321A82
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Feb 2021 15:47:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-4_W8M8ZgPC6th50lZmtpsw-1; Mon, 22 Feb 2021 09:47:22 -0500
X-MC-Unique: 4_W8M8ZgPC6th50lZmtpsw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2CF980196E;
	Mon, 22 Feb 2021 14:47:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 697965C290;
	Mon, 22 Feb 2021 14:47:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDB7618095C7;
	Mon, 22 Feb 2021 14:47:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11MElD9D004148 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 09:47:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A445B2026D13; Mon, 22 Feb 2021 14:47:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EE512026D36
	for <linux-cachefs@redhat.com>; Mon, 22 Feb 2021 14:47:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74E13100AFE1
	for <linux-cachefs@redhat.com>; Mon, 22 Feb 2021 14:47:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-357-g8AzX0tsOxO2MWCVNTqh3g-1;
	Mon, 22 Feb 2021 09:47:05 -0500
X-MC-Unique: g8AzX0tsOxO2MWCVNTqh3g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7676064E32;
	Mon, 22 Feb 2021 14:47:03 +0000 (UTC)
Message-ID: <5bb9b183ea568b9fab098c3e8bdd03fba13673df.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Xiubo Li <xiubli@redhat.com>, dhowells@redhat.com, idryomov@gmail.com
Date: Mon, 22 Feb 2021 09:47:02 -0500
In-Reply-To: <d6fcd45c-21eb-d00e-db8a-f2e9441d7f85@redhat.com>
References: <20210217125845.10319-1-jlayton@kernel.org>
	<20210217125845.10319-2-jlayton@kernel.org>
	<d6fcd45c-21eb-d00e-db8a-f2e9441d7f85@redhat.com>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11MElD9D004148
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH v2 1/6] ceph: disable old fscache
	readpage handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-19 at 13:09 +0800, Xiubo Li wrote:
> On 2021/2/17 20:58, Jeff Layton wrote:
> > With the new netfs read helper functions, we won't need a lot of this
> > infrastructure as it handles the pagecache pages itself. Rip out the
> > read handling for now, and much of the old infrastructure that deals in
> > individual pages.
> >=20
> > The cookie handling is mostly unchanged, however.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > Cc: ceph-devel@vger.kernel.org
> > Cc: linux-cachefs@redhat.com
> > Cc: linux-fsdevel@vger.kernel.org
> > ---
> > =A0=A0fs/ceph/addr.c  |  31 +-----------
> > =A0=A0fs/ceph/cache.c | 125 -------------------------------------------=
-----
> > =A0=A0fs/ceph/cache.h |  91 +----------------------------------
> > =A0=A0fs/ceph/caps.c  |   9 ----
> > =A0=A04 files changed, 3 insertions(+), 253 deletions(-)
> >=20
> > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > index 950552944436..2b17bb36e548 100644
> > --- a/fs/ceph/addr.c
> > +++ b/fs/ceph/addr.c
> > @@ -155,8 +155,6 @@ static void ceph_invalidatepage(struct page *page, =
unsigned int offset,
> > =A0=A0=09=09return;
> > =A0=A0=09}
> > =A0=A0
> >=20
> > -=09ceph_invalidate_fscache_page(inode, page);
> > -
> > =A0=A0=09WARN_ON(!PageLocked(page));
> > =A0=A0=09if (!PagePrivate(page))
> > =A0=A0=09=09return;
> > @@ -175,10 +173,6 @@ static int ceph_releasepage(struct page *page, gfp=
_t g)
> > =A0=A0=09dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->h=
ost,
> > =A0=A0=09     page, page->index, PageDirty(page) ? "" : "not ");
> > =A0=A0
> >=20
> > -=09/* Can we release the page from the cache? */
> > -=09if (!ceph_release_fscache_page(page, g))
> > -=09=09return 0;
> > -
> > =A0=A0=09return !PagePrivate(page);
> > =A0=A0}
> > =A0=A0
> >=20
> > @@ -213,10 +207,6 @@ static int ceph_do_readpage(struct file *filp, str=
uct page *page)
> > =A0=A0=09=09return 0;
> > =A0=A0=09}
> > =A0=A0
> >=20
> > -=09err =3D ceph_readpage_from_fscache(inode, page);
> > -=09if (err =3D=3D 0)
> > -=09=09return -EINPROGRESS;
> > -
> > =A0=A0=09dout("readpage ino %llx.%llx file %p off %llu len %llu page %p=
 index %lu\n",
> > =A0=A0=09     vino.ino, vino.snap, filp, off, len, page, page->index);
> > =A0=A0=09req =3D ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, =
&len, 0, 1,
> > @@ -241,7 +231,6 @@ static int ceph_do_readpage(struct file *filp, stru=
ct page *page)
> > =A0=A0=09if (err =3D=3D -ENOENT)
> > =A0=A0=09=09err =3D 0;
> > =A0=A0=09if (err < 0) {
> > -=09=09ceph_fscache_readpage_cancel(inode, page);
> > =A0=A0=09=09if (err =3D=3D -EBLOCKLISTED)
> > =A0=A0=09=09=09fsc->blocklisted =3D true;
> > =A0=A0=09=09goto out;
> > @@ -253,8 +242,6 @@ static int ceph_do_readpage(struct file *filp, stru=
ct page *page)
> > =A0=A0=09=09flush_dcache_page(page);
> > =A0=A0
> >=20
> > =A0=A0=09SetPageUptodate(page);
> > -=09ceph_readpage_to_fscache(inode, page);
> > -
> > =A0=A0out:
> > =A0=A0=09return err < 0 ? err : 0;
> > =A0=A0}
> > @@ -294,10 +281,8 @@ static void finish_read(struct ceph_osd_request *r=
eq)
> > =A0=A0=09for (i =3D 0; i < num_pages; i++) {
> > =A0=A0=09=09struct page *page =3D osd_data->pages[i];
> > =A0=A0
> >=20
> > -=09=09if (rc < 0 && rc !=3D -ENOENT) {
> > -=09=09=09ceph_fscache_readpage_cancel(inode, page);
> > +=09=09if (rc < 0 && rc !=3D -ENOENT)
> > =A0=A0=09=09=09goto unlock;
> > -=09=09}
> > =A0=A0=09=09if (bytes < (int)PAGE_SIZE) {
> > =A0=A0=09=09=09/* zero (remainder of) page */
> > =A0=A0=09=09=09int s =3D bytes < 0 ? 0 : bytes;
> > @@ -307,7 +292,6 @@ static void finish_read(struct ceph_osd_request *re=
q)
> > =A0=A0=09=09     page->index);
> > =A0=A0=09=09flush_dcache_page(page);
> > =A0=A0=09=09SetPageUptodate(page);
> > -=09=09ceph_readpage_to_fscache(inode, page);
> > =A0=A0unlock:
> > =A0=A0=09=09unlock_page(page);
> > =A0=A0=09=09put_page(page);
> > @@ -408,7 +392,6 @@ static int start_read(struct inode *inode, struct c=
eph_rw_context *rw_ctx,
> > =A0=A0=09=09     page->index);
> > =A0=A0=09=09if (add_to_page_cache_lru(page, &inode->i_data, page->index=
,
> > =A0=A0=09=09=09=09=09  GFP_KERNEL)) {
> > -=09=09=09ceph_fscache_uncache_page(inode, page);
> > =A0=A0=09=09=09put_page(page);
> > =A0=A0=09=09=09dout("start_read %p add_to_page_cache failed %p\n",
> > =A0=A0=09=09=09     inode, page);
> > @@ -440,10 +423,8 @@ static int start_read(struct inode *inode, struct =
ceph_rw_context *rw_ctx,
> > =A0=A0=09return nr_pages;
> > =A0=A0
> >=20
> > =A0=A0out_pages:
> > -=09for (i =3D 0; i < nr_pages; ++i) {
> > -=09=09ceph_fscache_readpage_cancel(inode, pages[i]);
> > +=09for (i =3D 0; i < nr_pages; ++i)
> > =A0=A0=09=09unlock_page(pages[i]);
> > -=09}
> > =A0=A0=09ceph_put_page_vector(pages, nr_pages, false);
> > =A0=A0out_put:
> > =A0=A0=09ceph_osdc_put_request(req);
> > @@ -471,12 +452,6 @@ static int ceph_readpages(struct file *file, struc=
t address_space *mapping,
> > =A0=A0=09if (ceph_inode(inode)->i_inline_version !=3D CEPH_INLINE_NONE)
> > =A0=A0=09=09return -EINVAL;
> > =A0=A0
> >=20
> > -=09rc =3D ceph_readpages_from_fscache(mapping->host, mapping, page_lis=
t,
> > -=09=09=09=09=09 &nr_pages);
> > -
> > -=09if (rc =3D=3D 0)
> > -=09=09goto out;
> > -
> > =A0=A0=09rw_ctx =3D ceph_find_rw_context(fi);
> > =A0=A0=09max =3D fsc->mount_options->rsize >> PAGE_SHIFT;
> > =A0=A0=09dout("readpages %p file %p ctx %p nr_pages %d max %d\n",
> > @@ -487,8 +462,6 @@ static int ceph_readpages(struct file *file, struct=
 address_space *mapping,
> > =A0=A0=09=09=09goto out;
> > =A0=A0=09}
> > =A0=A0out:
> > -=09ceph_fscache_readpages_cancel(inode, page_list);
> > -
> > =A0=A0=09dout("readpages %p file %p ret %d\n", inode, file, rc);
> > =A0=A0=09return rc;
> > =A0=A0}
> > diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
> > index 2f5cb6bc78e1..9cfadbb86568 100644
> > --- a/fs/ceph/cache.c
> > +++ b/fs/ceph/cache.c
> > @@ -173,7 +173,6 @@ void ceph_fscache_unregister_inode_cookie(struct ce=
ph_inode_info* ci)
> > =A0=A0
> >=20
> > =A0=A0=09ci->fscache =3D NULL;
> > =A0=A0
> >=20
> > -=09fscache_uncache_all_inode_pages(cookie, &ci->vfs_inode);
> > =A0=A0=09fscache_relinquish_cookie(cookie, &ci->i_vino, false);
> > =A0=A0}
> > =A0=A0
> >=20
> > @@ -194,7 +193,6 @@ void ceph_fscache_file_set_cookie(struct inode *ino=
de, struct file *filp)
> > =A0=A0=09=09dout("fscache_file_set_cookie %p %p disabling cache\n",
> > =A0=A0=09=09     inode, filp);
> > =A0=A0=09=09fscache_disable_cookie(ci->fscache, &ci->i_vino, false);
> > -=09=09fscache_uncache_all_inode_pages(ci->fscache, inode);
> > =A0=A0=09} else {
> > =A0=A0=09=09fscache_enable_cookie(ci->fscache, &ci->i_vino, i_size_read=
(inode),
> > =A0=A0=09=09=09=09      ceph_fscache_can_enable, inode);
> > @@ -205,108 +203,6 @@ void ceph_fscache_file_set_cookie(struct inode *i=
node, struct file *filp)
> > =A0=A0=09}
> > =A0=A0}
> > =A0=A0
> >=20
> > -static void ceph_readpage_from_fscache_complete(struct page *page, voi=
d *data, int error)
> > -{
> > -=09if (!error)
> > -=09=09SetPageUptodate(page);
> > -
> > -=09unlock_page(page);
> > -}
> > -
> > -static inline bool cache_valid(struct ceph_inode_info *ci)
> > -{
> > -=09return ci->i_fscache_gen =3D=3D ci->i_rdcache_gen;
> > -}
> > -
>=20
> Hi Jeff,
>=20
> Please delete the "i_fscache_gen" member from the struct ceph_inode_info=
=20
> if we are not using it any more.
>=20

Good catch. Fixed in my tree. I'll post an updated set in another day or
so with this rolled in.

Thanks,
--=20
Jeff Layton <jlayton@kernel.org>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

