Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C3E8723FEFA
	for <lists+linux-cachefs@lfdr.de>; Sun,  9 Aug 2020 17:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596985826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/xbF9LbSFQ1XYpip/WTGoXnNVrcwi8OVapOgzglYeJE=;
	b=g6DLx9KpfNu29i1EQUAMRMke9N3jmrDNWjKGKUF5QmjHTnTxfLvCylCwU6+Sz93rcljPpr
	6ToTM3bgJRgfpRQEGeqZzl0E2qqvw3B16jg6ii+4rXhAYsE+SN3y0AMYgpq0gZQUzKOUlD
	rHrc3zIQaNWsEgQGwkK7JXsvBI92oIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-JOF-JxcwN5GBi_kyWyXS7Q-1; Sun, 09 Aug 2020 11:10:24 -0400
X-MC-Unique: JOF-JxcwN5GBi_kyWyXS7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 835B0107ACCA;
	Sun,  9 Aug 2020 15:10:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B6781001B2B;
	Sun,  9 Aug 2020 15:10:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9ACD697526;
	Sun,  9 Aug 2020 15:10:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 079FAC8W021157 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 9 Aug 2020 11:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 357B52166BA4; Sun,  9 Aug 2020 15:10:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 306652166BA3
	for <linux-cachefs@redhat.com>; Sun,  9 Aug 2020 15:10:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5DF4800052
	for <linux-cachefs@redhat.com>; Sun,  9 Aug 2020 15:10:07 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
	[209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-147-i8fnPIIONuijztsePrlDtw-1; Sun, 09 Aug 2020 11:10:03 -0400
X-MC-Unique: i8fnPIIONuijztsePrlDtw-1
Received: by mail-ej1-f72.google.com with SMTP id lg2so2890515ejb.23
	for <linux-cachefs@redhat.com>; Sun, 09 Aug 2020 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A8yY4UrgEyySKzrlE+1ERiv4HG6a//xTjUPoaU2Bgis=;
	b=NPb7yIeNLTg6wivb/7DOBIIhyjopTrM8O4ZyXKKJkN++SIxZRDfXnQhvS99w9VgEV3
	POKuYZrNrv/jdjZNt3gWPBoKW7s7rXoD7BT35mYYS4aYs5X06lfaJX3CMPAc93ubtfak
	avC0dvHC114NxnKFdzvn4S9pFIvrhOmy2T2Fh1rZGL8pFn4GmP/v7qQw5mlJKhDNjYpv
	HKqIxNwWcJkF4GtKY93m1/CCJVFDtU40m6uPiSbQHhKC6aNHHV/fBd2ZTSzvIDOEeK1b
	00LMQaasIH4EU61rqIwV/904piNddFYts84cdBU4MD3OI2dKWpdqIEz6GCyiycYCwr2r
	RuwQ==
X-Gm-Message-State: AOAM53238fgn2kn7rbKWaebOB6g0o6mToizChLyEEavXaoc9JY5alUeL
	KTMAGb4SuUhdDPbpS4iARcBErxpwDkKg+nKg115eWeTE2shkX+LNCsV7OsYWTN36j09uhKAt5R7
	yG1sM9dB0hovQLyFpb8cf2K0QtXtaMrAHdVqZLQ==
X-Received: by 2002:a05:6402:308e:: with SMTP id
	de14mr17033991edb.344.1596985802513; 
	Sun, 09 Aug 2020 08:10:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEy386SBI1AcRVFWc876mZO2cVA9SJUEsxNFKEOe0itssEO9bxK5jj7h+vaIP5QSr7iwkXqYDZQzlyy2NNZNo=
X-Received: by 2002:a05:6402:308e:: with SMTP id
	de14mr17033948edb.344.1596985802033; 
	Sun, 09 Aug 2020 08:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200731130421.127022-1-jlayton@kernel.org>
	<20200731130421.127022-10-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-10-jlayton@kernel.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Sun, 9 Aug 2020 11:09:26 -0400
Message-ID: <CALF+zOnS9faaap1pZ_HfPzy2q4R_+HP84S02GxhrzWMD1WOYtg@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: ceph-devel@vger.kernel.org, linux-cachefs@redhat.com, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 09/11] ceph: convert readpages to
	fscache_read_helper
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

On Fri, Jul 31, 2020 at 9:05 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> Convert ceph_readpages to use the fscache_read_helper. With this we can
> rip out a lot of the old readpage/readpages infrastructure.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/ceph/addr.c | 209 +++++++------------------------------------------
>  1 file changed, 28 insertions(+), 181 deletions(-)
>
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index cee497c108bb..8905fe4a0930 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -377,76 +377,23 @@ static int ceph_readpage(struct file *filp, struct page *page)
>         return err;
>  }
>
> -/*
> - * Finish an async read(ahead) op.
> - */
> -static void finish_read(struct ceph_osd_request *req)
> -{
> -       struct inode *inode = req->r_inode;
> -       struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
> -       struct ceph_osd_data *osd_data;
> -       int rc = req->r_result <= 0 ? req->r_result : 0;
> -       int bytes = req->r_result >= 0 ? req->r_result : 0;
> -       int num_pages;
> -       int i;
> -
> -       dout("finish_read %p req %p rc %d bytes %d\n", inode, req, rc, bytes);
> -       if (rc == -EBLACKLISTED)
> -               ceph_inode_to_client(inode)->blacklisted = true;
> -
> -       /* unlock all pages, zeroing any data we didn't read */
> -       osd_data = osd_req_op_extent_osd_data(req, 0);
> -       BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
> -       num_pages = calc_pages_for((u64)osd_data->alignment,
> -                                       (u64)osd_data->length);
> -       for (i = 0; i < num_pages; i++) {
> -               struct page *page = osd_data->pages[i];
> -
> -               if (rc < 0 && rc != -ENOENT)
> -                       goto unlock;
> -               if (bytes < (int)PAGE_SIZE) {
> -                       /* zero (remainder of) page */
> -                       int s = bytes < 0 ? 0 : bytes;
> -                       zero_user_segment(page, s, PAGE_SIZE);
> -               }
> -               dout("finish_read %p uptodate %p idx %lu\n", inode, page,
> -                    page->index);
> -               flush_dcache_page(page);
> -               SetPageUptodate(page);
> -unlock:
> -               unlock_page(page);
> -               put_page(page);
> -               bytes -= PAGE_SIZE;
> -       }
> -
> -       ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
> -                                req->r_end_latency, rc);
> -
> -       kfree(osd_data->pages);
> -}
> -
> -/*
> - * start an async read(ahead) operation.  return nr_pages we submitted
> - * a read for on success, or negative error code.
> - */
> -static int start_read(struct inode *inode, struct ceph_rw_context *rw_ctx,
> -                     struct list_head *page_list, int max)
> +static int ceph_readpages(struct file *file, struct address_space *mapping,
> +                         struct list_head *page_list, unsigned nr_pages)
>  {
> -       struct ceph_osd_client *osdc =
> -               &ceph_inode_to_client(inode)->client->osdc;
> +       struct inode *inode = file_inode(file);
>         struct ceph_inode_info *ci = ceph_inode(inode);
> -       struct page *page = lru_to_page(page_list);
> -       struct ceph_vino vino;
> -       struct ceph_osd_request *req;
> -       u64 off;
> -       u64 len;
> -       int i;
> -       struct page **pages;
> -       pgoff_t next_index;
> -       int nr_pages = 0;
> +       struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
> +       struct ceph_file_info *fi = file->private_data;
> +       struct ceph_rw_context *rw_ctx;
> +       struct fscache_cookie *cookie = ceph_fscache_cookie(ci);
>         int got = 0;
>         int ret = 0;
> +       int max = fsc->mount_options->rsize >> PAGE_SHIFT;

Have you ran tests with different values of rsize?
Specifically, rsize < readahead_size == size_of_readpages

I'm seeing a lot of problems with NFS when varying rsize are used wrt
readahead values.  Specifically I'm seeing panics because fscache
expects a 1:1 mapping of issue_op() to io_done() calls, and I get
panics because multiple read completions are trying to unlock the
same pages inside fscache_read_done().

My understanding is afs does not have such 'rsize' limitation, so it
may not be an area that is well tested.  It could be my implementation
of the NFS conversion though, as I thinkwhat needs to happen is the
respect the above 1:1 mapping of issue_op() to io_done() calls, and my
initial implementation did not do that.

FWIW, specifically this unit test was originally failing for me with a panic.
Sun 09 Aug 2020 11:03:22 AM EDT: 1. On NFS client, install and enable
cachefilesd
Sun 09 Aug 2020 11:03:22 AM EDT: 2. On NFS client, mount -o
vers=4.1,fsc,rsize=16384 127.0.0.1:/export/dir1 /mnt/dir1
Sun 09 Aug 2020 11:03:22 AM EDT: 3. On NFS client, dd if=/dev/zero
of=/mnt/dir1/file1.bin bs=65536 count=1
Sun 09 Aug 2020 11:03:22 AM EDT: 4. On NFS client, echo 3 >
/proc/sys/vm/drop_caches
Sun 09 Aug 2020 11:03:22 AM EDT: 5. On NFS client, ./nfs-readahead.sh
set /mnt/dir1 65536
Sun 09 Aug 2020 11:03:23 AM EDT: 6. On NFS client, dd
if=/mnt/dir1/file1.bin of=/dev/null
Sun 09 Aug 2020 11:03:23 AM EDT: 8. On NFS client, echo 3 >
/proc/sys/vm/drop_caches
Sun 09 Aug 2020 11:03:23 AM EDT: 9. On NFS client, dd
if=/mnt/dir1/file1.bin of=/dev/null



> +
> +       if (ceph_inode(inode)->i_inline_version != CEPH_INLINE_NONE)
> +               return -EINVAL;
>
> +       rw_ctx = ceph_find_rw_context(fi);
>         if (!rw_ctx) {
>                 /* caller of readpages does not hold buffer and read caps
>                  * (fadvise, madvise and readahead cases) */
> @@ -459,133 +406,33 @@ static int start_read(struct inode *inode, struct ceph_rw_context *rw_ctx,
>                         dout("start_read %p, no cache cap\n", inode);
>                         ret = 0;
>                 }
> -               if (ret <= 0) {
> -                       if (got)
> -                               ceph_put_cap_refs(ci, got);
> -                       while (!list_empty(page_list)) {
> -                               page = lru_to_page(page_list);
> -                               list_del(&page->lru);
> -                               put_page(page);
> -                       }
> -                       return ret;
> -               }
> +               if (ret <= 0)
> +                       goto out;
>         }
>
> -       off = (u64) page_offset(page);
> +       dout("readpages %p file %p ctx %p nr_pages %d max %d\n",
> +            inode, file, rw_ctx, nr_pages, max);
>
> -       /* count pages */
> -       next_index = page->index;
> -       list_for_each_entry_reverse(page, page_list, lru) {
> -               if (page->index != next_index)
> -                       break;
> -               nr_pages++;
> -               next_index++;
> -               if (max && nr_pages == max)
> -                       break;
> -       }
> -       len = nr_pages << PAGE_SHIFT;
> -       dout("start_read %p nr_pages %d is %lld~%lld\n", inode, nr_pages,
> -            off, len);
> -       vino = ceph_vino(inode);
> -       req = ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len,
> -                                   0, 1, CEPH_OSD_OP_READ,
> -                                   CEPH_OSD_FLAG_READ, NULL,
> -                                   ci->i_truncate_seq, ci->i_truncate_size,
> -                                   false);
> -       if (IS_ERR(req)) {
> -               ret = PTR_ERR(req);
> -               goto out;
> -       }
> +       while (ret >= 0 && !list_empty(page_list)) {
> +               struct ceph_fscache_req *req = ceph_fsreq_alloc();
>
> -       /* build page vector */
> -       nr_pages = calc_pages_for(0, len);
> -       pages = kmalloc_array(nr_pages, sizeof(*pages), GFP_KERNEL);
> -       if (!pages) {
> -               ret = -ENOMEM;
> -               goto out_put;
> -       }
> -       for (i = 0; i < nr_pages; ++i) {
> -               page = list_entry(page_list->prev, struct page, lru);
> -               BUG_ON(PageLocked(page));
> -               list_del(&page->lru);
> -
> -               dout("start_read %p adding %p idx %lu\n", inode, page,
> -                    page->index);
> -               if (add_to_page_cache_lru(page, &inode->i_data, page->index,
> -                                         GFP_KERNEL)) {
> -                       put_page(page);
> -                       dout("start_read %p add_to_page_cache failed %p\n",
> -                            inode, page);
> -                       nr_pages = i;
> -                       if (nr_pages > 0) {
> -                               len = nr_pages << PAGE_SHIFT;
> -                               osd_req_op_extent_update(req, 0, len);
> -                               break;
> -                       }
> -                       goto out_pages;
> +               if (!req) {
> +                       ret = -ENOMEM;
> +                       break;
>                 }
> -               pages[i] = page;
> -       }
> -       osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false, false);
> -       req->r_callback = finish_read;
> -       req->r_inode = inode;
> -
> -       dout("start_read %p starting %p %lld~%lld\n", inode, req, off, len);
> -       ret = ceph_osdc_start_request(osdc, req, false);
> -       if (ret < 0)
> -               goto out_pages;
> -       ceph_osdc_put_request(req);
> -
> -       /* After adding locked pages to page cache, the inode holds cache cap.
> -        * So we can drop our cap refs. */
> -       if (got)
> -               ceph_put_cap_refs(ci, got);
> -
> -       return nr_pages;
> +               fscache_init_io_request(&req->fscache_req, cookie, &ceph_readpage_fsreq_ops);
> +               req->fscache_req.mapping = inode->i_mapping;
>
> -out_pages:
> -       for (i = 0; i < nr_pages; ++i) {
> -               unlock_page(pages[i]);
> +               ret = fscache_read_helper_page_list(&req->fscache_req, page_list, max);
> +               ceph_fsreq_put(&req->fscache_req);
>         }
> -       ceph_put_page_vector(pages, nr_pages, false);
> -out_put:
> -       ceph_osdc_put_request(req);
>  out:
> +       /* After adding locked pages to page cache, the inode holds Fc refs. We can drop ours. */
>         if (got)
>                 ceph_put_cap_refs(ci, got);
> -       return ret;
> -}
>
> -
> -/*
> - * Read multiple pages.  Leave pages we don't read + unlock in page_list;
> - * the caller (VM) cleans them up.
> - */
> -static int ceph_readpages(struct file *file, struct address_space *mapping,
> -                         struct list_head *page_list, unsigned nr_pages)
> -{
> -       struct inode *inode = file_inode(file);
> -       struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
> -       struct ceph_file_info *fi = file->private_data;
> -       struct ceph_rw_context *rw_ctx;
> -       int rc = 0;
> -       int max = 0;
> -
> -       if (ceph_inode(inode)->i_inline_version != CEPH_INLINE_NONE)
> -               return -EINVAL;
> -
> -       rw_ctx = ceph_find_rw_context(fi);
> -       max = fsc->mount_options->rsize >> PAGE_SHIFT;
> -       dout("readpages %p file %p ctx %p nr_pages %d max %d\n",
> -            inode, file, rw_ctx, nr_pages, max);
> -       while (!list_empty(page_list)) {
> -               rc = start_read(inode, rw_ctx, page_list, max);
> -               if (rc < 0)
> -                       goto out;
> -       }
> -out:
> -       dout("readpages %p file %p ret %d\n", inode, file, rc);
> -       return rc;
> +       dout("readpages %p file %p ret %d\n", inode, file, ret);
> +       return ret;
>  }
>
>  struct ceph_writeback_ctl
> --
> 2.26.2
>
>
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-cachefs
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

