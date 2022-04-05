Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CC4F3B27
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Apr 2022 17:15:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-7NIwtSXjNW21Cs_NfMEK2A-1; Tue, 05 Apr 2022 11:15:06 -0400
X-MC-Unique: 7NIwtSXjNW21Cs_NfMEK2A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 555D4833942;
	Tue,  5 Apr 2022 15:15:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E61E3401E77;
	Tue,  5 Apr 2022 15:15:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 904C3194036C;
	Tue,  5 Apr 2022 15:15:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A83971947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Apr 2022 15:15:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 97365401E9D; Tue,  5 Apr 2022 15:15:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C6D401E77
 for <linux-cachefs@redhat.com>; Tue,  5 Apr 2022 15:15:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AA68100BAAC
 for <linux-cachefs@redhat.com>; Tue,  5 Apr 2022 15:15:00 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-GqMES5HHOGe29dbilaejRQ-1; Tue, 05 Apr 2022 11:14:57 -0400
X-MC-Unique: GqMES5HHOGe29dbilaejRQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A34EB81E30;
 Tue,  5 Apr 2022 15:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870C3C385A0;
 Tue,  5 Apr 2022 15:14:53 +0000 (UTC)
Message-ID: <db91644d8ffda763fe19d4f47466a3bd4a0f3b55.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Dave Wysochanski <dwysocha@redhat.com>, dhowells@redhat.com
Date: Tue, 05 Apr 2022 11:14:52 -0400
In-Reply-To: <20220405142810.8208-1-dwysocha@redhat.com>
References: <20220405142810.8208-1-dwysocha@redhat.com>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v2] cachefiles: Fix KASAN
 slab-out-of-bounds in cachefiles_set_volume_xattr
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: smfrench@gmail.com, linux-cachefs@redhat.com, linux-cifs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-04-05 at 10:28 -0400, Dave Wysochanski wrote:
> Use the actual length of volume coherency data when setting the
> xattr to avoid the following KASAN report.
> 
>  BUG: KASAN: slab-out-of-bounds in cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
>  Write of size 4 at addr ffff888101e02af4 by task kworker/6:0/1347
> 
>  CPU: 6 PID: 1347 Comm: kworker/6:0 Kdump: loaded Not tainted 5.18.0-rc1-nfs-fscache-netfs+ #13
>  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-4.fc34 04/01/2014
>  Workqueue: events fscache_create_volume_work [fscache]
>  Call Trace:
>   <TASK>
>   dump_stack_lvl+0x45/0x5a
>   print_report.cold+0x5e/0x5db
>   ? __lock_text_start+0x8/0x8
>   ? cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
>   kasan_report+0xab/0x120
>   ? cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
>   kasan_check_range+0xf5/0x1d0
>   memcpy+0x39/0x60
>   cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
>   cachefiles_acquire_volume+0x2be/0x500 [cachefiles]
>   ? __cachefiles_free_volume+0x90/0x90 [cachefiles]
>   fscache_create_volume_work+0x68/0x160 [fscache]
>   process_one_work+0x3b7/0x6a0
>   worker_thread+0x2c4/0x650
>   ? process_one_work+0x6a0/0x6a0
>   kthread+0x16c/0x1a0
>   ? kthread_complete_and_exit+0x20/0x20
>   ret_from_fork+0x22/0x30
>   </TASK>
> 
>  Allocated by task 1347:
>   kasan_save_stack+0x1e/0x40
>   __kasan_kmalloc+0x81/0xa0
>   cachefiles_set_volume_xattr+0x76/0x350 [cachefiles]
>   cachefiles_acquire_volume+0x2be/0x500 [cachefiles]
>   fscache_create_volume_work+0x68/0x160 [fscache]
>   process_one_work+0x3b7/0x6a0
>   worker_thread+0x2c4/0x650
>   kthread+0x16c/0x1a0
>   ret_from_fork+0x22/0x30
> 
>  The buggy address belongs to the object at ffff888101e02af0
>  which belongs to the cache kmalloc-8 of size 8
>  The buggy address is located 4 bytes inside of
>  8-byte region [ffff888101e02af0, ffff888101e02af8)
> 
>  The buggy address belongs to the physical page:
>  page:00000000a2292d70 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x101e02
>  flags: 0x17ffffc0000200(slab|node=0|zone=2|lastcpupid=0x1fffff)
>  raw: 0017ffffc0000200 0000000000000000 dead000000000001 ffff888100042280
>  raw: 0000000000000000 0000000080660066 00000001ffffffff 0000000000000000
>  page dumped because: kasan: bad access detected
> 
>  Memory state around the buggy address:
>  ffff888101e02980: fc 00 fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc
>  ffff888101e02a00: 00 fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc 00
>  >ffff888101e02a80: fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc 04 fc
>                                                             ^
>  ffff888101e02b00: fc fc fc 00 fc fc fc fc 00 fc fc fc fc 00 fc fc
>  ffff888101e02b80: fc fc 00 fc fc fc fc 00 fc fc fc fc 00 fc fc fc
>  ==================================================================
> 
> Fixes: 413a4a6b0b55 "cachefiles: Fix volume coherency attribute"
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> ---
>  fs/cachefiles/xattr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
> index 35465109d9c4..f13b642c1d14 100644
> --- a/fs/cachefiles/xattr.c
> +++ b/fs/cachefiles/xattr.c
> @@ -198,8 +198,7 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
>  
>  	_enter("%x,#%d", volume->vcookie->debug_id, len);
>  
> -	len += sizeof(*buf);
> -	buf = kmalloc(len, GFP_KERNEL);
> +	buf = kmalloc(sizeof(*buf) + len, GFP_KERNEL);
>  	if (!buf)
>  		return false;
>  	buf->reserved = cpu_to_be32(0);

I hit this bug earlier today too.

Reviewed-and-Tested-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

