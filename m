Return-Path: <linux-cachefs-bounces@listman.redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0B031D9D4
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 13:59:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-IvImMnBgNH-Jnhf7rW7Osg-1; Wed, 17 Feb 2021 07:59:05 -0500
X-MC-Unique: IvImMnBgNH-Jnhf7rW7Osg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 320E1835E23;
	Wed, 17 Feb 2021 12:59:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF0710023B4;
	Wed, 17 Feb 2021 12:59:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECE3718095CE;
	Wed, 17 Feb 2021 12:59:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HCww0h022591 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 07:58:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D580E10F1CD2; Wed, 17 Feb 2021 12:58:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1983107CCFA
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86E9E800962
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-526-eXPG7dExMMe8YwOiSur8TA-1;
	Wed, 17 Feb 2021 07:58:54 -0500
X-MC-Unique: eXPG7dExMMe8YwOiSur8TA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D0CD64E5F;
	Wed, 17 Feb 2021 12:58:52 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com, idryomov@gmail.com
Date: Wed, 17 Feb 2021 07:58:45 -0500
Message-Id: <20210217125845.10319-7-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11HCww0h022591
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v2 6/6] ceph: convert ceph_readpages to
	ceph_readahead
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Convert ceph_readpages to ceph_readahead and make it use
netfs_readahead. With this we can rip out a lot of the old
readpage/readpages infrastructure.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Cc: ceph-devel@vger.kernel.org
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
---
 fs/ceph/addr.c | 230 ++++++++-----------------------------------------
 1 file changed, 35 insertions(+), 195 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 774fd4efffd7..4f6c8cc0eec9 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -340,214 +340,54 @@ static int ceph_readpage(struct file *file, struct p=
age *page)
 =09return netfs_readpage(file, page, &ceph_readpage_netfs_ops, NULL);
 }
=20
-/*
- * Finish an async read(ahead) op.
- */
-static void finish_read(struct ceph_osd_request *req)
-{
-=09struct inode *inode =3D req->r_inode;
-=09struct ceph_fs_client *fsc =3D ceph_inode_to_client(inode);
-=09struct ceph_osd_data *osd_data;
-=09int rc =3D req->r_result <=3D 0 ? req->r_result : 0;
-=09int bytes =3D req->r_result >=3D 0 ? req->r_result : 0;
-=09int num_pages;
-=09int i;
-
-=09dout("finish_read %p req %p rc %d bytes %d\n", inode, req, rc, bytes);
-=09if (rc =3D=3D -EBLOCKLISTED)
-=09=09ceph_inode_to_client(inode)->blocklisted =3D true;
-
-=09/* unlock all pages, zeroing any data we didn't read */
-=09osd_data =3D osd_req_op_extent_osd_data(req, 0);
-=09BUG_ON(osd_data->type !=3D CEPH_OSD_DATA_TYPE_PAGES);
-=09num_pages =3D calc_pages_for((u64)osd_data->alignment,
-=09=09=09=09=09(u64)osd_data->length);
-=09for (i =3D 0; i < num_pages; i++) {
-=09=09struct page *page =3D osd_data->pages[i];
-
-=09=09if (rc < 0 && rc !=3D -ENOENT)
-=09=09=09goto unlock;
-=09=09if (bytes < (int)PAGE_SIZE) {
-=09=09=09/* zero (remainder of) page */
-=09=09=09int s =3D bytes < 0 ? 0 : bytes;
-=09=09=09zero_user_segment(page, s, PAGE_SIZE);
-=09=09}
- =09=09dout("finish_read %p uptodate %p idx %lu\n", inode, page,
-=09=09     page->index);
-=09=09flush_dcache_page(page);
-=09=09SetPageUptodate(page);
-unlock:
-=09=09unlock_page(page);
-=09=09put_page(page);
-=09=09bytes -=3D PAGE_SIZE;
-=09}
-
-=09ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
-=09=09=09=09 req->r_end_latency, rc);
-
-=09kfree(osd_data->pages);
-}
-
-/*
- * start an async read(ahead) operation.  return nr_pages we submitted
- * a read for on success, or negative error code.
- */
-static int start_read(struct inode *inode, struct ceph_rw_context *rw_ctx,
-=09=09      struct list_head *page_list, int max)
+static void ceph_readahead_cleanup(struct address_space *mapping, void *pr=
iv)
 {
-=09struct ceph_osd_client *osdc =3D
-=09=09&ceph_inode_to_client(inode)->client->osdc;
+=09struct inode *inode =3D mapping->host;
 =09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09struct page *page =3D lru_to_page(page_list);
-=09struct ceph_vino vino;
-=09struct ceph_osd_request *req;
-=09u64 off;
-=09u64 len;
-=09int i;
-=09struct page **pages;
-=09pgoff_t next_index;
-=09int nr_pages =3D 0;
-=09int got =3D 0;
-=09int ret =3D 0;
+=09int got =3D (int)(uintptr_t)priv;
=20
-=09if (!rw_ctx) {
-=09=09/* caller of readpages does not hold buffer and read caps
-=09=09 * (fadvise, madvise and readahead cases) */
-=09=09int want =3D CEPH_CAP_FILE_CACHE;
-=09=09ret =3D ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want,
-=09=09=09=09=09true, &got);
-=09=09if (ret < 0) {
-=09=09=09dout("start_read %p, error getting cap\n", inode);
-=09=09} else if (!(got & want)) {
-=09=09=09dout("start_read %p, no cache cap\n", inode);
-=09=09=09ret =3D 0;
-=09=09}
-=09=09if (ret <=3D 0) {
-=09=09=09if (got)
-=09=09=09=09ceph_put_cap_refs(ci, got);
-=09=09=09while (!list_empty(page_list)) {
-=09=09=09=09page =3D lru_to_page(page_list);
-=09=09=09=09list_del(&page->lru);
-=09=09=09=09put_page(page);
-=09=09=09}
-=09=09=09return ret;
-=09=09}
-=09}
-
-=09off =3D (u64) page_offset(page);
-
-=09/* count pages */
-=09next_index =3D page->index;
-=09list_for_each_entry_reverse(page, page_list, lru) {
-=09=09if (page->index !=3D next_index)
-=09=09=09break;
-=09=09nr_pages++;
-=09=09next_index++;
-=09=09if (max && nr_pages =3D=3D max)
-=09=09=09break;
-=09}
-=09len =3D nr_pages << PAGE_SHIFT;
-=09dout("start_read %p nr_pages %d is %lld~%lld\n", inode, nr_pages,
-=09     off, len);
-=09vino =3D ceph_vino(inode);
-=09req =3D ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len,
-=09=09=09=09    0, 1, CEPH_OSD_OP_READ,
-=09=09=09=09    CEPH_OSD_FLAG_READ, NULL,
-=09=09=09=09    ci->i_truncate_seq, ci->i_truncate_size,
-=09=09=09=09    false);
-=09if (IS_ERR(req)) {
-=09=09ret =3D PTR_ERR(req);
-=09=09goto out;
-=09}
-
-=09/* build page vector */
-=09nr_pages =3D calc_pages_for(0, len);
-=09pages =3D kmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
-=09if (!pages) {
-=09=09ret =3D -ENOMEM;
-=09=09goto out_put;
-=09}
-=09for (i =3D 0; i < nr_pages; ++i) {
-=09=09page =3D list_entry(page_list->prev, struct page, lru);
-=09=09BUG_ON(PageLocked(page));
-=09=09list_del(&page->lru);
-
- =09=09dout("start_read %p adding %p idx %lu\n", inode, page,
-=09=09     page->index);
-=09=09if (add_to_page_cache_lru(page, &inode->i_data, page->index,
-=09=09=09=09=09  GFP_KERNEL)) {
-=09=09=09put_page(page);
-=09=09=09dout("start_read %p add_to_page_cache failed %p\n",
-=09=09=09     inode, page);
-=09=09=09nr_pages =3D i;
-=09=09=09if (nr_pages > 0) {
-=09=09=09=09len =3D nr_pages << PAGE_SHIFT;
-=09=09=09=09osd_req_op_extent_update(req, 0, len);
-=09=09=09=09break;
-=09=09=09}
-=09=09=09goto out_pages;
-=09=09}
-=09=09pages[i] =3D page;
-=09}
-=09osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false, false);
-=09req->r_callback =3D finish_read;
-=09req->r_inode =3D inode;
-
-=09dout("start_read %p starting %p %lld~%lld\n", inode, req, off, len);
-=09ret =3D ceph_osdc_start_request(osdc, req, false);
-=09if (ret < 0)
-=09=09goto out_pages;
-=09ceph_osdc_put_request(req);
-
-=09/* After adding locked pages to page cache, the inode holds cache cap.
-=09 * So we can drop our cap refs. */
 =09if (got)
 =09=09ceph_put_cap_refs(ci, got);
-
-=09return nr_pages;
-
-out_pages:
-=09for (i =3D 0; i < nr_pages; ++i)
-=09=09unlock_page(pages[i]);
-=09ceph_put_page_vector(pages, nr_pages, false);
-out_put:
-=09ceph_osdc_put_request(req);
-out:
-=09if (got)
-=09=09ceph_put_cap_refs(ci, got);
-=09return ret;
 }
+const struct netfs_read_request_ops ceph_readahead_netfs_ops =3D {
+=09.init_rreq=09=09=3D ceph_init_rreq,
+=09.is_cache_enabled=09=3D ceph_is_cache_enabled,
+=09.begin_cache_operation=09=3D ceph_begin_cache_operation,
+=09.issue_op=09=09=3D ceph_netfs_issue_op,
+=09.expand_readahead=09=3D ceph_netfs_expand_readahead,
+=09.clamp_length=09=09=3D ceph_netfs_clamp_length,
+=09.cleanup=09=09=3D ceph_readahead_cleanup,
+};
=20
-
-/*
- * Read multiple pages.  Leave pages we don't read + unlock in page_list;
- * the caller (VM) cleans them up.
- */
-static int ceph_readpages(struct file *file, struct address_space *mapping=
,
-=09=09=09  struct list_head *page_list, unsigned nr_pages)
+static void ceph_readahead(struct readahead_control *ractl)
 {
-=09struct inode *inode =3D file_inode(file);
-=09struct ceph_fs_client *fsc =3D ceph_inode_to_client(inode);
-=09struct ceph_file_info *fi =3D file->private_data;
+=09struct inode *inode =3D file_inode(ractl->file);
+=09struct ceph_file_info *fi =3D ractl->file->private_data;
 =09struct ceph_rw_context *rw_ctx;
-=09int rc =3D 0;
-=09int max =3D 0;
+=09int got =3D 0;
+=09int ret =3D 0;
=20
 =09if (ceph_inode(inode)->i_inline_version !=3D CEPH_INLINE_NONE)
-=09=09return -EINVAL;
+=09=09return;
=20
 =09rw_ctx =3D ceph_find_rw_context(fi);
-=09max =3D fsc->mount_options->rsize >> PAGE_SHIFT;
-=09dout("readpages %p file %p ctx %p nr_pages %d max %d\n",
-=09     inode, file, rw_ctx, nr_pages, max);
-=09while (!list_empty(page_list)) {
-=09=09rc =3D start_read(inode, rw_ctx, page_list, max);
-=09=09if (rc < 0)
-=09=09=09goto out;
+=09if (!rw_ctx) {
+=09=09/*
+=09=09 * readahead callers do not necessarily hold Fcb caps
+=09=09 * (e.g. fadvise, madvise).
+=09=09 */
+=09=09int want =3D CEPH_CAP_FILE_CACHE;
+
+=09=09ret =3D ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got)=
;
+=09=09if (ret < 0)
+=09=09=09dout("start_read %p, error getting cap\n", inode);
+=09=09else if (!(got & want))
+=09=09=09dout("start_read %p, no cache cap\n", inode);
+
+=09=09if (ret <=3D 0)
+=09=09=09return;
 =09}
-out:
-=09dout("readpages %p file %p ret %d\n", inode, file, rc);
-=09return rc;
+=09netfs_readahead(ractl, &ceph_readahead_netfs_ops, (void *)(uintptr_t)go=
t);
 }
=20
 struct ceph_writeback_ctl
@@ -1501,7 +1341,7 @@ static ssize_t ceph_direct_io(struct kiocb *iocb, str=
uct iov_iter *iter)
=20
 const struct address_space_operations ceph_aops =3D {
 =09.readpage =3D ceph_readpage,
-=09.readpages =3D ceph_readpages,
+=09.readahead =3D ceph_readahead,
 =09.writepage =3D ceph_writepage,
 =09.writepages =3D ceph_writepages_start,
 =09.write_begin =3D ceph_write_begin,
--=20
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

