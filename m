Return-Path: <linux-cachefs-bounces@listman.redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id 09BC831D9D3
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 13:59:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-K4DdczNgP2WR-A1XKsY2yg-1; Wed, 17 Feb 2021 07:59:05 -0500
X-MC-Unique: K4DdczNgP2WR-A1XKsY2yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E18106BB24;
	Wed, 17 Feb 2021 12:59:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 750B05D719;
	Wed, 17 Feb 2021 12:59:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A429218095CD;
	Wed, 17 Feb 2021 12:59:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HCwwh1022586 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 07:58:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 73697202F4F4; Wed, 17 Feb 2021 12:58:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E9492026D46
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 560C780080E
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-140-Hn9DI6B7M_uGKQhffBodyQ-1;
	Wed, 17 Feb 2021 07:58:53 -0500
X-MC-Unique: Hn9DI6B7M_uGKQhffBodyQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E66A64E63;
	Wed, 17 Feb 2021 12:58:51 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com, idryomov@gmail.com
Date: Wed, 17 Feb 2021 07:58:44 -0500
Message-Id: <20210217125845.10319-6-jlayton@kernel.org>
In-Reply-To: <20210217125845.10319-1-jlayton@kernel.org>
References: <20210217125845.10319-1-jlayton@kernel.org>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11HCwwh1022586
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v2 5/6] ceph: plug write_begin into read
	helper
X-BeenThere: linux-cachefs@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list
	<linux-cachefs.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@listman.redhat.com>
List-Help: <mailto:linux-cachefs-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@listman.redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@listman.redhat.com
Errors-To: linux-cachefs-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Convert ceph_write_begin to use the netfs_write_begin helper. Most of
the ops we need for it are already in place from the readpage conversion
but we do add a new check_write_begin op since ceph needs to be able to
vet whether there is an incompatible writeback already in flight before
reading in the page.

With this, we can also remove the old ceph_do_readpage helper.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Cc: ceph-devel@vger.kernel.org
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
---
 fs/ceph/addr.c | 188 ++++++++++++++++---------------------------------
 1 file changed, 62 insertions(+), 126 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 6d4de969f761..774fd4efffd7 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -340,76 +340,6 @@ static int ceph_readpage(struct file *file, struct pag=
e *page)
 =09return netfs_readpage(file, page, &ceph_readpage_netfs_ops, NULL);
 }
=20
-/* read a single page, without unlocking it. */
-static int ceph_do_readpage(struct file *filp, struct page *page)
-{
-=09struct inode *inode =3D file_inode(filp);
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09struct ceph_fs_client *fsc =3D ceph_inode_to_client(inode);
-=09struct ceph_osd_client *osdc =3D &fsc->client->osdc;
-=09struct ceph_osd_request *req;
-=09struct ceph_vino vino =3D ceph_vino(inode);
-=09int err =3D 0;
-=09u64 off =3D page_offset(page);
-=09u64 len =3D PAGE_SIZE;
-
-=09if (off >=3D i_size_read(inode)) {
-=09=09zero_user_segment(page, 0, PAGE_SIZE);
-=09=09SetPageUptodate(page);
-=09=09return 0;
-=09}
-
-=09if (ci->i_inline_version !=3D CEPH_INLINE_NONE) {
-=09=09/*
-=09=09 * Uptodate inline data should have been added
-=09=09 * into page cache while getting Fcr caps.
-=09=09 */
-=09=09if (off =3D=3D 0)
-=09=09=09return -EINVAL;
-=09=09zero_user_segment(page, 0, PAGE_SIZE);
-=09=09SetPageUptodate(page);
-=09=09return 0;
-=09}
-
-=09dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %l=
u\n",
-=09     vino.ino, vino.snap, filp, off, len, page, page->index);
-=09req =3D ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len, 0, =
1,
-=09=09=09=09    CEPH_OSD_OP_READ, CEPH_OSD_FLAG_READ, NULL,
-=09=09=09=09    ci->i_truncate_seq, ci->i_truncate_size,
-=09=09=09=09    false);
-=09if (IS_ERR(req))
-=09=09return PTR_ERR(req);
-
-=09osd_req_op_extent_osd_data_pages(req, 0, &page, len, 0, false, false);
-
-=09err =3D ceph_osdc_start_request(osdc, req, false);
-=09if (!err)
-=09=09err =3D ceph_osdc_wait_request(osdc, req);
-
-=09ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
-=09=09=09=09 req->r_end_latency, err);
-
-=09ceph_osdc_put_request(req);
-=09dout("readpage result %d\n", err);
-
-=09if (err =3D=3D -ENOENT)
-=09=09err =3D 0;
-=09if (err < 0) {
-=09=09if (err =3D=3D -EBLOCKLISTED)
-=09=09=09fsc->blocklisted =3D true;
-=09=09goto out;
-=09}
-=09if (err < PAGE_SIZE)
-=09=09/* zero fill remainder of page */
-=09=09zero_user_segment(page, err, PAGE_SIZE);
-=09else
-=09=09flush_dcache_page(page);
-
-=09SetPageUptodate(page);
-out:
-=09return err < 0 ? err : 0;
-}
-
 /*
  * Finish an async read(ahead) op.
  */
@@ -1429,6 +1359,41 @@ ceph_find_incompatible(struct page *page)
 =09return NULL;
 }
=20
+static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, uns=
igned int len,
+=09=09=09=09=09struct page *page, void **_fsdata)
+{
+=09struct inode *inode =3D file_inode(file);
+=09struct ceph_inode_info *ci =3D ceph_inode(inode);
+=09struct ceph_snap_context *snapc;
+
+=09snapc =3D ceph_find_incompatible(page);
+=09if (snapc) {
+=09=09int r;
+
+=09=09unlock_page(page);
+=09=09put_page(page);
+=09=09if (IS_ERR(snapc))
+=09=09=09return PTR_ERR(snapc);
+
+=09=09ceph_queue_writeback(inode);
+=09=09r =3D wait_event_killable(ci->i_cap_wq,
+=09=09=09=09=09context_is_writeable_or_written(inode, snapc));
+=09=09ceph_put_snap_context(snapc);
+=09=09return r =3D=3D 0 ? -EAGAIN : r;
+=09}
+=09return 0;
+}
+
+const struct netfs_read_request_ops ceph_netfs_write_begin_ops =3D {
+=09.init_rreq=09=09=3D ceph_init_rreq,
+=09.is_cache_enabled=09=3D ceph_is_cache_enabled,
+=09.begin_cache_operation=09=3D ceph_begin_cache_operation,
+=09.issue_op=09=09=3D ceph_netfs_issue_op,
+=09.expand_readahead=09=3D ceph_netfs_expand_readahead,
+=09.clamp_length=09=09=3D ceph_netfs_clamp_length,
+=09.check_write_begin=09=3D ceph_netfs_check_write_begin,
+};
+
 /*
  * We are only allowed to write into/dirty the page if the page is
  * clean, or already dirty within the same snap context.
@@ -1439,75 +1404,46 @@ static int ceph_write_begin(struct file *file, stru=
ct address_space *mapping,
 {
 =09struct inode *inode =3D file_inode(file);
 =09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09struct ceph_snap_context *snapc;
 =09struct page *page =3D NULL;
 =09pgoff_t index =3D pos >> PAGE_SHIFT;
-=09int pos_in_page =3D pos & ~PAGE_MASK;
-=09int r =3D 0;
-
-=09dout("write_begin file %p inode %p page %p %d~%d\n", file, inode, page,=
 (int)pos, (int)len);
-
-=09for (;;) {
-=09=09page =3D grab_cache_page_write_begin(mapping, index, flags);
-=09=09if (!page) {
-=09=09=09r =3D -ENOMEM;
-=09=09=09break;
-=09=09}
-
-=09=09snapc =3D ceph_find_incompatible(page);
-=09=09if (snapc) {
-=09=09=09if (IS_ERR(snapc)) {
-=09=09=09=09r =3D PTR_ERR(snapc);
-=09=09=09=09break;
-=09=09=09}
-=09=09=09unlock_page(page);
-=09=09=09put_page(page);
-=09=09=09page =3D NULL;
-=09=09=09ceph_queue_writeback(inode);
-=09=09=09r =3D wait_event_killable(ci->i_cap_wq,
-=09=09=09=09=09=09context_is_writeable_or_written(inode, snapc));
-=09=09=09ceph_put_snap_context(snapc);
-=09=09=09if (r !=3D 0)
-=09=09=09=09break;
-=09=09=09continue;
-=09=09}
-
-=09=09if (PageUptodate(page)) {
-=09=09=09dout(" page %p already uptodate\n", page);
-=09=09=09break;
-=09=09}
+=09int r;
=20
+=09if (ci->i_inline_version !=3D CEPH_INLINE_NONE) {
 =09=09/*
-=09=09 * In some cases we don't need to read at all:
-=09=09 * - full page write
-=09=09 * - write that lies completely beyond EOF
-=09=09 * - write that covers the the page from start to EOF or beyond it
+=09=09 * In principle, we should never get here, as the inode should have =
been uninlined
+=09=09 * before we're allowed to write to the page (in write_iter or page_=
mkwrite).
 =09=09 */
-=09=09if ((pos_in_page =3D=3D 0 && len =3D=3D PAGE_SIZE) ||
-=09=09    (pos >=3D i_size_read(inode)) ||
-=09=09    (pos_in_page =3D=3D 0 && (pos + len) >=3D i_size_read(inode))) {
-=09=09=09zero_user_segments(page, 0, pos_in_page,
-=09=09=09=09=09   pos_in_page + len, PAGE_SIZE);
-=09=09=09break;
-=09=09}
+=09=09WARN_ONCE(1, "ceph: write_begin called on still-inlined inode!\n");
=20
 =09=09/*
-=09=09 * We need to read it. If we get back -EINPROGRESS, then the page wa=
s
-=09=09 * handed off to fscache and it will be unlocked when the read compl=
etes.
-=09=09 * Refind the page in that case so we can reacquire the page lock. O=
therwise
-=09=09 * we got a hard error or the read was completed synchronously.
+=09=09 * Uptodate inline data should have been added
+=09=09 * into page cache while getting Fcr caps.
 =09=09 */
-=09=09r =3D ceph_do_readpage(file, page);
-=09=09if (r !=3D -EINPROGRESS)
-=09=09=09break;
+=09=09if (index =3D=3D 0) {
+=09=09=09r =3D -EINVAL;
+=09=09=09goto out;
+=09=09}
+
+=09=09page =3D grab_cache_page_write_begin(mapping, index, flags);
+=09=09if (!page)
+=09=09=09return -ENOMEM;
+
+=09=09zero_user_segment(page, 0, PAGE_SIZE);
+=09=09SetPageUptodate(page);
+=09=09r =3D 0;
+=09=09goto out;
 =09}
=20
+=09r =3D netfs_write_begin(file, inode->i_mapping, pos, len, 0, &page, NUL=
L,
+=09=09=09      &ceph_netfs_write_begin_ops, NULL);
+out:
+=09if (r =3D=3D 0)
+=09=09wait_on_page_fscache(page);
 =09if (r < 0) {
-=09=09if (page) {
-=09=09=09unlock_page(page);
+=09=09if (page)
 =09=09=09put_page(page);
-=09=09}
 =09} else {
+=09=09WARN_ON_ONCE(!PageLocked(page));
 =09=09*pagep =3D page;
 =09}
 =09return r;
--=20
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

