Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B691A1A04E2
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Apr 2020 04:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586226457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EtzGX97oOop6VarHaYcLrYTWmf4eLO75+yMil5qO0I8=;
	b=av/wLi5bhygKKl6QN3XdA4K4PlNOrzjLycl3Yzz5uy3pUgHNIB7PEbLVl78rzxhfuQIrKh
	aUQaRRUwLUjCiB1tSYz0Wa/s69quqLFodPNZHC2UCZapaAbiXFyTFrYlAOeOg7/RA+eeDN
	Olr5WcyuJh0Ht2/wra8yVpZj5jDAjo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-EuG1VGKbP2miRbyb2lmfqg-1; Mon, 06 Apr 2020 22:27:33 -0400
X-MC-Unique: EuG1VGKbP2miRbyb2lmfqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EE20107ACCC;
	Tue,  7 Apr 2020 02:27:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F95F60BF7;
	Tue,  7 Apr 2020 02:27:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6740B93A6D;
	Tue,  7 Apr 2020 02:27:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372RLsA001039 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:27:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CF0E5DA7B; Tue,  7 Apr 2020 02:27:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from [10.72.12.246] (ovpn-12-246.pek2.redhat.com [10.72.12.246])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BBC85D9C5;
	Tue,  7 Apr 2020 02:27:15 +0000 (UTC)
To: dhowells@redhat.com, linux-cachefs@redhat.com
References: <1584709355-7071-1-git-send-email-xiubli@redhat.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <929da299-609f-f943-477d-0a32c23891c2@redhat.com>
Date: Tue, 7 Apr 2020 10:27:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1584709355-7071-1-git-send-email-xiubli@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: jlayton@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: fix assertion failed after
	bmap
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Ping.

Thanks
BRs


On 2020/3/20 21:02, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
>
> <7>[  333.227204] ceph:  page/inode not in cache
> <7>[  333.571182] ceph:  page/inode not in cache
> <7>[  333.741097] ceph:  page/inode not in cache
> <7>[  337.977233] ceph:  all-page read submitted
> <7>[  339.649714] ceph:  all-page read submitted
> <3>[  339.654882] CacheFiles:
> <3>[  339.654952] CacheFiles: Assertion failed
> <4>[  339.655124] ------------[ cut here ]------------
> <2>[  339.655126] kernel BUG at fs/cachefiles/rdwr.c:434!
> <4>[  339.655225] invalid opcode: 0000 [#1] SMP KASAN PTI
> <4>[  339.655309] CPU: 0 PID: 3004 Comm: python2 Tainted: G            E     5.6.0-rc6+ #77
> <4>[  339.655436] Hardware name: Red Hat RHEV Hypervisor, BIOS 1.11.0-2.el7 04/01/2014
> <4>[  339.655578] RIP: 0010:cachefiles_read_or_alloc_page.cold.19+0xa2/0xcd [cachefiles]
> <4>[  339.656007] RSP: 0018:ffff88838110f610 EFLAGS: 00010282
> <4>[  339.656095] RAX: 000000000000001c RBX: ffff88836e564600 RCX: 0000000000000001
> <4>[  339.656210] RDX: 0000000000000000 RSI: 0000000000000007 RDI: ffff888389c22bd0
> <4>[  339.656326] RBP: ffff88837b502e48 R08: ffffed107138457b R09: ffffed107138457b
> <4>[  339.656441] R10: ffffed107138457a R11: ffff888389c22bd3 R12: ffffea000d2dffc0
> <4>[  339.656563] R13: 0000000000000000 R14: ffff88835ef44700 R15: ffff88835ef44600
> <4>[  339.656679] FS:  00007fbb546c3740(0000) GS:ffff888389c00000(0000) knlGS:0000000000000000
> <4>[  339.656809] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[  339.656902] CR2: 0000561ecd9c5108 CR3: 000000036c20a000 CR4: 00000000000406f0
> <4>[  339.657020] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> <4>[  339.657136] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> <4>[  339.657251] Call Trace:
> <4>[  339.657322]  ? fscache_run_op.isra.10+0x80/0x150 [fscache]
> <4>[  339.657421]  ? cachefiles_read_copier+0x920/0x920 [cachefiles]
> <4>[  339.657529]  ? fscache_wait_for_operation_activation+0xe2/0x310 [fscache]
> <4>[  339.657659]  __fscache_read_or_alloc_page+0x3d2/0x520 [fscache]
> <4>[  339.657797]  ceph_readpage_from_fscache+0x80/0x110 [ceph]
> <4>[  339.657915]  ceph_do_readpage+0x1f3/0x660 [ceph]
> <4>[  339.657997]  ? scan_shadow_nodes+0x50/0x50
> <4>[  339.658094]  ? writepages_finish+0x700/0x700 [ceph]
> <4>[  339.658178]  ? add_to_page_cache_lru+0x10e/0x190
> <4>[  339.658255]  ? add_to_page_cache_locked+0x10/0x10
> <4>[  339.658361]  ceph_readpage+0x12/0x40 [ceph]
> <4>[  339.658433]  generic_file_buffered_read+0xa4e/0x1160
> <4>[  339.658517]  ? read_cache_page_gfp+0x20/0x20
> <4>[  339.658599]  ? down_read+0xe0/0x190
> <4>[  339.658661]  ? unaccount_page_cache_page+0x2f0/0x2f0
> <4>[  339.658743]  ? generic_file_read_iter+0x3b/0x220
> <4>[  339.658846]  ceph_read_iter+0x321/0x1430 [ceph]
> <4>[  339.658923]  ? avc_has_perm_noaudit+0x147/0x200
> <4>[  339.659027]  ? ceph_direct_read_write+0xee0/0xee0 [ceph]
> <4>[  339.659115]  ? perf_event_fork+0x20/0x20
> <4>[  339.659182]  ? vma_wants_writenotify+0x6f/0x240
> <4>[  339.659257]  ? __ia32_sys_mmap_pgoff+0x80/0x80
> <4>[  339.659334]  ? __rb_insert_augmented+0x34/0x3f0
> <4>[  339.662451]  ? vm_get_page_prot+0x60/0x60
> <4>[  339.665560]  ? vma_set_page_prot+0xe5/0x100
> <4>[  339.668668]  ? mmap_region+0x370/0xa60
> <4>[  339.671773]  ? userfaultfd_unmap_complete+0x89/0x1e0
> <4>[  339.674900]  ? new_sync_read+0x286/0x3b0
> <4>[  339.678011]  new_sync_read+0x286/0x3b0
> <4>[  339.681102]  ? __ia32_sys_llseek+0x1d0/0x1d0
> <4>[  339.684196]  ? __fsnotify_parent+0x8d/0x1f0
> <4>[  339.687242]  ? fsnotify+0x5c5/0x600
> <4>[  339.690224]  ? __fsnotify_inode_delete+0x20/0x20
> <4>[  339.693188]  ? avc_policy_seqno+0x22/0x30
> <4>[  339.696043]  ? security_file_permission+0xe1/0x180
> <4>[  339.698821]  vfs_read+0xaf/0x1b0
> <4>[  339.701518]  ksys_read+0xb4/0x150
> <4>[  339.704177]  ? kernel_write+0xb0/0xb0
> <4>[  339.706822]  do_syscall_64+0x73/0x260
> <4>[  339.709427]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> <4>[  339.712055] RIP: 0033:0x7fbb534eb950
>
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
>   fs/cachefiles/rdwr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
> index 1dc97f2..073c14c 100644
> --- a/fs/cachefiles/rdwr.c
> +++ b/fs/cachefiles/rdwr.c
> @@ -431,7 +431,7 @@ int cachefiles_read_or_alloc_page(struct fscache_retrieval *op,
>   	block <<= shift;
>   
>   	ret = bmap(inode, &block);
> -	ASSERT(ret < 0);
> +	ASSERT(!ret);
>   
>   	_debug("%llx -> %llx",
>   	       (unsigned long long) (page->index << shift),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

