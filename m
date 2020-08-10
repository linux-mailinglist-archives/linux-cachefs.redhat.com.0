Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 35B672406FA
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 15:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597067496;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t8x56EQDY+sJvooBwcrAIqrg5oeetOTgOCX//u4ud+k=;
	b=QDXLCL5WNDjYGMf5wi6Ylz8lw+R4DNJz10Pun67vtz0k+hrq384r+LZJzAzMrjrn/bCnZS
	RN8o3fNd+6K73eC+//dCE/kTRbiZWCz31TayVy4+lNrqBkIdoMzowUPbfjETKRIra5ZD1B
	ozYBLDd4Z4b4KLkX9BLuRsYCr9OUug8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-rKQibqzJMpK58de2pEDqRA-1; Mon, 10 Aug 2020 09:51:34 -0400
X-MC-Unique: rKQibqzJMpK58de2pEDqRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40271101C8B3;
	Mon, 10 Aug 2020 13:51:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2AC06F126;
	Mon, 10 Aug 2020 13:51:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E9681809554;
	Mon, 10 Aug 2020 13:51:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ADpQsx028181 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 09:51:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAE802166BA0; Mon, 10 Aug 2020 13:51:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6E7B2166B27
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 13:51:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CCE5185A797
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 13:51:23 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15-MLuXHOWrN0OiuVPWHlSziA-1; Mon, 10 Aug 2020 09:51:21 -0400
X-MC-Unique: MLuXHOWrN0OiuVPWHlSziA-1
Received: by mail-ed1-f71.google.com with SMTP id c3so3236825edm.7
	for <linux-cachefs@redhat.com>; Mon, 10 Aug 2020 06:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b/L7LGn0GNJThbZ32LxX6WxNhl18Hx6kduB2ZOvENUc=;
	b=CAEzefPGxsLwRjGB6rl1xh+6Tp1BeaWoNgLtHS0ddzrurAM+wf8JkZTllaGJ479qOr
	v6B2yUt9bxbHP5781fSZQKYXo4gv+hKGkSSD3NbkixrL8BCW1hOUT8zCNhhAJr9TLmfO
	QyCkp3NDtqsgPfwNVej2VHrwL3WI3kTBVr5fUxnywmXM/O/9KC41zj/TCq5WaU9jwwUj
	HhkbE7+AlcQAq1ElWmbKVA4ECN5tCkL6uSMozQqPZZYxl5R4OOucpHzZqwwPzaxDbW9e
	BQbNW/c6Rt5DhfrmNpgaWa2njJM2bq8E3XvxiV0MTfKL+UUungu7LW4EgiqKyWgddrx7
	U4LA==
X-Gm-Message-State: AOAM53026rWIhBNWiLtVp3B81lxL/tXHqyiRXkUqRaoEUU0HYEloVBq6
	ArTVgatFQB328T64Wb16JdWzcq3gWDNnKvHdZUkpGzE2GWrU9CTR7v97N8vjjVPvX2JL3lFAcM/
	XCGMZc5/80MVJNTdMSxcVHojc/Njryt5aMVhoGw==
X-Received: by 2002:a17:906:f202:: with SMTP id
	gt2mr21208819ejb.70.1597067480411; 
	Mon, 10 Aug 2020 06:51:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+PgQwhPLCL2rAL21Q4KEmb2tYjtMqMgleeCNdfIqVq6sqOW3PjOPLEUBRUZlibqJsN6MyEXsebC8sIKVs6UE=
X-Received: by 2002:a17:906:f202:: with SMTP id
	gt2mr21208804ejb.70.1597067480169; 
	Mon, 10 Aug 2020 06:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200731130421.127022-1-jlayton@kernel.org>
	<20200731130421.127022-10-jlayton@kernel.org>
	<CALF+zOnQ6diJv4bMbf-HSYmHusT_iE1dAqp-j_kjuqyLqfp-nw@mail.gmail.com>
	<526038.1597054155@warthog.procyon.org.uk>
In-Reply-To: <526038.1597054155@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Mon, 10 Aug 2020 09:50:44 -0400
Message-ID: <CALF+zO=K8iE5y7_5MPS4Zg+stUmY4FQobop1DnsS71Dpn_YpOg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, idryomov@gmail.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2020 at 6:09 AM David Howells <dhowells@redhat.com> wrote:
>
> David Wysochanski <dwysocha@redhat.com> wrote:
>
> > Looks like fscache_shape_request() overrides any 'max_pages' value (actually
> > it is cachefiles_shape_request) , so it's unclear why the netfs would pass
> > in a 'max_pages' if it is not honored - seems like a bug maybe or it's not
> > obvious
>
> I think the problem is that cachefiles_shape_request() is applying the limit
> too early.  It's using it to cut down the number of pages in the original
> request (only applicable to readpages), but then the shaping to fit cache
> granules can exceed that, so it needs to be applied later also.
>
> Does the attached patch help?
>
> David
> ---
> diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
> index 2bfba2e41c39..ce05cf1d9a6e 100644
> --- a/fs/cachefiles/content-map.c
> +++ b/fs/cachefiles/content-map.c
> @@ -134,7 +134,8 @@ void cachefiles_shape_request(struct fscache_object *obj,
>         _enter("{%lx,%lx,%x},%llx,%d",
>                start, end, max_pages, i_size, shape->for_write);
>
> -       if (start >= CACHEFILES_SIZE_LIMIT / PAGE_SIZE) {
> +       if (start >= CACHEFILES_SIZE_LIMIT / PAGE_SIZE ||
> +           max_pages < CACHEFILES_GRAN_PAGES) {
>                 shape->to_be_done = FSCACHE_READ_FROM_SERVER;
>                 return;
>         }
> @@ -144,10 +145,6 @@ void cachefiles_shape_request(struct fscache_object *obj,
>         if (shape->i_size > CACHEFILES_SIZE_LIMIT)
>                 i_size = CACHEFILES_SIZE_LIMIT;
>
> -       max_pages = round_down(max_pages, CACHEFILES_GRAN_PAGES);
> -       if (end - start > max_pages)
> -               end = start + max_pages;
> -
>         granule = start / CACHEFILES_GRAN_PAGES;
>         if (granule / 8 >= object->content_map_size) {
>                 cachefiles_expand_content_map(object, i_size);
> @@ -185,6 +182,10 @@ void cachefiles_shape_request(struct fscache_object *obj,
>                 start = round_down(start, CACHEFILES_GRAN_PAGES);
>                 end   = round_up(end, CACHEFILES_GRAN_PAGES);
>
> +               /* Trim to the maximum size the netfs supports */
> +               if (end - start > max_pages)
> +                       end = round_down(start + max_pages, CACHEFILES_GRAN_PAGES);
> +
>                 /* But trim to the end of the file and the starting page */
>                 eof = (i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
>                 if (eof <= shape->proposed_start)
>

I tried this and got the same panic - I think i_size is the culprit
(it is larger than max_pages).  I'll send you a larger trace offline
with cachefiles/fscache debugging enabled if that helps, but below is
some custom tracing that may be enough because it shows before / after
shaping values.

Here's outline of the test (smaller rsize and readahead for simplicity):
# ./t1_rsize_lt_read.sh 4.1
Setting NFS vers=4.1
Mon 10 Aug 2020 09:34:18 AM EDT: 1. On NFS client, install and enable
cachefilesd
Mon 10 Aug 2020 09:34:18 AM EDT: 2. On NFS client, mount -o
vers=4.1,fsc,rsize=8192 127.0.0.1:/export/dir1 /mnt/dir1
Mon 10 Aug 2020 09:34:18 AM EDT: 3. On NFS client, dd if=/dev/zero
of=/mnt/dir1/file1.bin bs=16384 count=1
Mon 10 Aug 2020 09:34:18 AM EDT: 4. On NFS client, echo 3 >
/proc/sys/vm/drop_caches
Mon 10 Aug 2020 09:34:19 AM EDT: 5. On NFS client, ./nfs-readahead.sh
set /mnt/dir1 16384
Mon 10 Aug 2020 09:34:19 AM EDT: 6. On NFS client, dd
if=/mnt/dir1/file1.bin of=/dev/null
Mon 10 Aug 2020 09:34:19 AM EDT: 7. On NFS client, echo 3 >
/proc/sys/vm/drop_caches
Mon 10 Aug 2020 09:34:19 AM EDT: 8. On NFS client, dd
if=/mnt/dir1/file1.bin of=/dev/null


Console with custom nfs tracing
[   62.955355] t1_rsize_lt_rea (4840): drop_caches: 3
[   63.028786] fs/nfs/fscache.c:480 before read_helper_page_list pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 pages
ffffb4b4c0fafca8 max_pages 2
[   63.028804] fs/fscache/read_helper.c:347 pid 4882
fscache_read_helper before shape req ffff8902f50b5800 req->nr_pages 0
shape.actual_nr_pages 48 shape.proposed_nr_pages 4
[   63.037231] fs/fscache/read_helper.c:353 pid 4882
fscache_read_helper after shape req ffff8902f50b5800 req->nr_pages 0
shape.actual_nr_pages 4 shape.proposed_nr_pages 4
[   63.043421] fs/fscache/read_helper.c:531 pid 4882
fscache_read_helper before while req ffff8902f50b5800 req->nr_pages 1
shape.actual_nr_pages 4 shape.proposed_nr_pages 4
[   63.049498] fs/fscache/read_helper.c:531 pid 4882
fscache_read_helper before while req ffff8902f50b5800 req->nr_pages 2
shape.actual_nr_pages 4 shape.proposed_nr_pages 4
[   63.063708] fs/fscache/read_helper.c:531 pid 4882
fscache_read_helper before while req ffff8902f50b5800 req->nr_pages 3
shape.actual_nr_pages 4 shape.proposed_nr_pages 4
[   63.070114] fs/fscache/read_helper.c:531 pid 4882
fscache_read_helper before while req ffff8902f50b5800 req->nr_pages 4
shape.actual_nr_pages 4 shape.proposed_nr_pages 4
[   63.076438] fs/nfs/fscache.c:369 enter nfs_issue_op pid 4882 inode
ffff8902b4a2a828 cache ffff8902f50b5800 start 0 last 3
[   63.082964] fs/nfs/fscache.c:379 before readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f08741a00
[   63.087591] fs/nfs/fscache.c:382 after readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f08741a00 cache.error 0
[   63.093058] fs/nfs/fscache.c:379 before readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f08288680
[   63.098927] fs/nfs/fscache.c:382 after readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f08288680 cache.error 0
[   63.104507] fs/nfs/fscache.c:379 before readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f082816c0
[   63.110922] fs/nfs/fscache.c:382 after readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f082816c0 cache.error 0
[   63.111973] fs/nfs/fscache.c:523 pid 233 before io_done inode
ffff8902b4a2a828 bytes 8192 &req->cache ffff8902f50b5800 cache.pos 0
cache.len 16384
[   63.115407] fs/nfs/fscache.c:379 before readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f067e8f40
[   63.126337] fs/nfs/fscache.c:382 after readpage_async_filler pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 page
fffff42f067e8f40 cache.error 0
[   63.131411] fs/nfs/fscache.c:388 exit nfs_issue_op pid 4882 inode
ffff8902b4a2a828 cache ffff8902f50b5800
[   63.131955] fs/nfs/fscache.c:523 pid 233 before io_done inode
ffff8902b4a2a828 bytes 8192 &req->cache ffff8902f50b5800 cache.pos 0
cache.len 16384
[   63.137012] fs/nfs/fscache.c:484 after read_helper_page_list pid
4882 inode ffff8902b4a2a828 cache ffff8902f50b5800 cache.pos 0
cache.len 16384 cache.nr_pages 4 pages ffffb4b4c0fafca8 ret 0
[   63.140922] page:fffff42f08741a00 refcount:2 mapcount:0
mapping:00000000727f3adc index:0x0
[   63.141091] mapping->aops:nfs_file_aops [nfs] dentry name:"file1.bin"
[   63.146475] fs/nfs/fscache.c:490 outside while(!list_empty(pages))
read_helper_page_list pid 4882 inode ffff8902b4a2a828 cache
ffff8902f50b5800 cache.pos 0 cache.len 16384 cache.nr_pages 4
[   63.146740] fs/fscache/read_helper.c:347 pid 4882
fscache_read_helper before shape req ffff8902f50b5800 req->nr_pages 0
shape.actual_nr_pages 3227832042 shape.proposed_nr_pages 1
[   63.153662] flags: 0x17ffffc0000006(referenced|uptodate)
[   63.153699] raw: 0017ffffc0000006 dead000000000100 dead000000000122
ffff8902b4a2a9a0
[   63.168174] fs/fscache/read_helper.c:353 pid 4882
fscache_read_helper after shape req ffff8902f50b5800 req->nr_pages 0
shape.actual_nr_pages 5 shape.proposed_nr_pages 1
[   63.193131] raw: 0000000000000000 0000000000000000 00000001ffffffff
ffff8902ecfe8000
[   63.203785] page dumped because: VM_BUG_ON_PAGE(!PageLocked(page))
[   63.206372] page->mem_cgroup:ffff8902ecfe8000
[   63.208333] ------------[ cut here ]------------
[   63.211081] kernel BUG at mm/filemap.c:1290!
[   63.213152] invalid opcode: 0000 [#1] SMP PTI

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

