Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CA669C84
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Jan 2023 16:35:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673624152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Aot2tfyjUL+kDfqBLV8rm93iQcsFfXUEXrvJsoP8OAs=;
	b=Qyww3PpZZhwqN/LGql3OyE4Emi79OducYABCe2ETLXDLXVL4xcnRpDJMNf6ymnSuNCex8r
	DvX1whIhAbDiYwPHry9xWr28cLAQIt8oT9ssumw1eOCJQHgLNNd4MjFD7ZJJ2VqWVBct93
	BcayrYomgoVuVrNmxCv7rZbQoJ1VFC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592--dtdlXbTPjGCxW_AvFWftw-1; Fri, 13 Jan 2023 10:35:48 -0500
X-MC-Unique: -dtdlXbTPjGCxW_AvFWftw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C75B857D0D;
	Fri, 13 Jan 2023 15:35:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C61B953A0;
	Fri, 13 Jan 2023 15:35:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE4C2194705A;
	Fri, 13 Jan 2023 15:35:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C1901946A78 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5A38E40C2004; Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5342740C2064
 for <linux-cachefs@redhat.com>; Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3429D29AA38E
 for <linux-cachefs@redhat.com>; Fri, 13 Jan 2023 15:35:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-DFMUZxRWPzOZPPSZZ96GjA-1; Fri, 13 Jan 2023 10:35:43 -0500
X-MC-Unique: DFMUZxRWPzOZPPSZZ96GjA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A37461FC3;
 Fri, 13 Jan 2023 15:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D676C433EF;
 Fri, 13 Jan 2023 15:27:23 +0000 (UTC)
Message-ID: <445ebed318067cd31f5df17d8f5a52963f49fc04.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Hou Tao <houtao@huaweicloud.com>, linux-cachefs@redhat.com
Date: Fri, 13 Jan 2023 10:27:22 -0500
In-Reply-To: <20230113115211.2895845-2-houtao@huaweicloud.com>
References: <20230113115211.2895845-1-houtao@huaweicloud.com>
 <20230113115211.2895845-2-houtao@huaweicloud.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v3 1/2] fscache: Use wait_on_bit() to
 wait for the freeing of relinquished volume
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
Cc: linux-kernel@vger.kernel.org, houtao1@huawei.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-01-13 at 19:52 +0800, Hou Tao wrote:
> From: Hou Tao <houtao1@huawei.com>
> 
> The freeing of relinquished volume will wake up the pending volume
> acquisition by using wake_up_bit(), however it is mismatched with
> wait_var_event() used in fscache_wait_on_volume_collision() and it will
> never wake up the waiter in the wait-queue because these two functions
> operate on different wait-queues.
> 
> According to the implementation in fscache_wait_on_volume_collision(),
> if the wake-up of pending acquisition is delayed longer than 20 seconds
> (e.g., due to the delay of on-demand fd closing), the first
> wait_var_event_timeout() will timeout and the following wait_var_event()
> will hang forever as shown below:
> 
>  FS-Cache: Potential volume collision new=00000024 old=00000022
>  ......
>  INFO: task mount:1148 blocked for more than 122 seconds.
>        Not tainted 6.1.0-rc6+ #1
>  task:mount           state:D stack:0     pid:1148  ppid:1
>  Call Trace:
>   <TASK>
>   __schedule+0x2f6/0xb80
>   schedule+0x67/0xe0
>   fscache_wait_on_volume_collision.cold+0x80/0x82
>   __fscache_acquire_volume+0x40d/0x4e0
>   erofs_fscache_register_volume+0x51/0xe0 [erofs]
>   erofs_fscache_register_fs+0x19c/0x240 [erofs]
>   erofs_fc_fill_super+0x746/0xaf0 [erofs]
>   vfs_get_super+0x7d/0x100
>   get_tree_nodev+0x16/0x20
>   erofs_fc_get_tree+0x20/0x30 [erofs]
>   vfs_get_tree+0x24/0xb0
>   path_mount+0x2fa/0xa90
>   do_mount+0x7c/0xa0
>   __x64_sys_mount+0x8b/0xe0
>   do_syscall_64+0x30/0x60
>   entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> Considering that wake_up_bit() is more selective, so fix it by using
> wait_on_bit() instead of wait_var_event() to wait for the freeing of
> relinquished volume. In addition because waitqueue_active() is used in
> wake_up_bit() and clear_bit() doesn't imply any memory barrier, use
> clear_and_wake_up_bit() to add the missing memory barrier between
> cursor->flags and waitqueue_active().
> 
> Fixes: 62ab63352350 ("fscache: Implement volume registration")
> Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  fs/fscache/volume.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
> index ab8ceddf9efa..903af9d85f8b 100644
> --- a/fs/fscache/volume.c
> +++ b/fs/fscache/volume.c
> @@ -141,13 +141,14 @@ static bool fscache_is_acquire_pending(struct fscache_volume *volume)
>  static void fscache_wait_on_volume_collision(struct fscache_volume *candidate,
>  					     unsigned int collidee_debug_id)
>  {
> -	wait_var_event_timeout(&candidate->flags,
> -			       !fscache_is_acquire_pending(candidate), 20 * HZ);
> +	wait_on_bit_timeout(&candidate->flags, FSCACHE_VOLUME_ACQUIRE_PENDING,
> +			    TASK_UNINTERRUPTIBLE, 20 * HZ);
>  	if (fscache_is_acquire_pending(candidate)) {
>  		pr_notice("Potential volume collision new=%08x old=%08x",
>  			  candidate->debug_id, collidee_debug_id);
>  		fscache_stat(&fscache_n_volumes_collision);
> -		wait_var_event(&candidate->flags, !fscache_is_acquire_pending(candidate));
> +		wait_on_bit(&candidate->flags, FSCACHE_VOLUME_ACQUIRE_PENDING,
> +			    TASK_UNINTERRUPTIBLE);
>  	}
>  }
>  
> @@ -347,8 +348,8 @@ static void fscache_wake_pending_volume(struct fscache_volume *volume,
>  	hlist_bl_for_each_entry(cursor, p, h, hash_link) {
>  		if (fscache_volume_same(cursor, volume)) {
>  			fscache_see_volume(cursor, fscache_volume_see_hash_wake);
> -			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);
> -			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);
> +			clear_and_wake_up_bit(FSCACHE_VOLUME_ACQUIRE_PENDING,
> +					      &cursor->flags);
>  			return;
>  		}
>  	}

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

