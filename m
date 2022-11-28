Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66D63A25D
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Nov 2022 08:56:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669622216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AMHGT501ZC3BNux2MNkiVDN53v8A1yrysSFJAGjsz2I=;
	b=ekiKfKyWsOUypHasFMv625Do7e5xoqwVcLpV1U3iwYfLZ6nbhYrpitIpjGWerJJ2T4gWAv
	u+OU0JmPILSOyw/BNscVuYwoku2g5cCTkmXL8A/pGnawxIb70xvvZ1RCZrKRemX0o+FO/6
	kMVuF1hd93Jcpmf1f64VqnSQ1TVeYtY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-vGUIGs4hMr-WpUxhBacQpw-1; Mon, 28 Nov 2022 02:56:53 -0500
X-MC-Unique: vGUIGs4hMr-WpUxhBacQpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B820887402;
	Mon, 28 Nov 2022 07:56:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43F214EA52;
	Mon, 28 Nov 2022 07:56:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1AD81946594;
	Mon, 28 Nov 2022 07:56:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABCF11946588 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Nov 2022 07:56:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 75C6C141511E; Mon, 28 Nov 2022 07:56:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D35C1415100
 for <linux-cachefs@redhat.com>; Mon, 28 Nov 2022 07:56:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52D783C14100
 for <linux-cachefs@redhat.com>; Mon, 28 Nov 2022 07:56:45 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-484-jDrOzD_LNuuMvlOo5uMMnw-1; Mon, 28 Nov 2022 02:56:41 -0500
X-MC-Unique: jDrOzD_LNuuMvlOo5uMMnw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VVqxcrL_1669622195
Received: from 30.221.131.211(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VVqxcrL_1669622195) by smtp.aliyun-inc.com;
 Mon, 28 Nov 2022 15:56:36 +0800
Message-ID: <e1069bfc-be19-df66-dfeb-8a7aac0a9b97@linux.alibaba.com>
Date: Mon, 28 Nov 2022 15:56:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Hou Tao <houtao@huaweicloud.com>, linux-cachefs@redhat.com
References: <20221128031929.3918348-1-houtao@huaweicloud.com>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20221128031929.3918348-1-houtao@huaweicloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH] fscache: Use wake_up_var() to wake up
 pending volume acquisition
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, houtao1@huawei.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Thanks for catching this.


On 11/28/22 11:19 AM, Hou Tao wrote:
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
> Fixing it by using wake_up_var() instead of wake_up_bit(). In addition
> because waitqueue_active() is used in wake_up_var() and clear_bit()
> doesn't imply any memory barrier, so do smp_mb__after_atomic() before
> invoking wake_up_var().
> 
> Fixes: 62ab63352350 ("fscache: Implement volume registration")
> Signed-off-by: Hou Tao <houtao1@huawei.com>

Reviewed-and-tested-by: Jingbo Xu <jefflexu@linux.alibaba.com>


> ---
>  fs/fscache/volume.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
> index ab8ceddf9efa..cf8293bb1aca 100644
> --- a/fs/fscache/volume.c
> +++ b/fs/fscache/volume.c
> @@ -348,7 +348,12 @@ static void fscache_wake_pending_volume(struct fscache_volume *volume,
>  		if (fscache_volume_same(cursor, volume)) {
>  			fscache_see_volume(cursor, fscache_volume_see_hash_wake);
>  			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);
> -			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);
> +			/*
> +			 * Paired with barrier in wait_var_event(). Check
> +			 * waitqueue_active() and wake_up_var() for details.
> +			 */
> +			smp_mb__after_atomic();
> +			wake_up_var(&cursor->flags);
>  			return;
>  		}
>  	}

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

