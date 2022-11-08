Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE82620763
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Nov 2022 04:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667878140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GLTmvJ4ncc5uQm7Ta2BCZM8Gi3gu5eVQ23/5ph6lMfk=;
	b=i0tqkCh3fWl62FjgTiSnEpF41GgV9p6e3IQYymosGyroWmsxFuPbE4hZrMvlOr80kPe+zb
	ulLZplceZgkLL7s4NKZiL+Uskee8Oj+fYa2vCbmTsEDU1Mn8nTlp/oSxzAwaUJdpVtk+iP
	KT0hCZJ3k/9NyPH7thFsDI5epCn08SA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-Nr2OCu82NiCdctfnbukkKw-1; Mon, 07 Nov 2022 22:28:57 -0500
X-MC-Unique: Nr2OCu82NiCdctfnbukkKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 815A2811E67;
	Tue,  8 Nov 2022 03:28:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 714CD492B05;
	Tue,  8 Nov 2022 03:28:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 30B2A194658C;
	Tue,  8 Nov 2022 03:28:52 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A4321946587 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Nov 2022 03:28:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C38F02033979; Tue,  8 Nov 2022 03:28:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC7182033970
 for <linux-cachefs@redhat.com>; Tue,  8 Nov 2022 03:28:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E3E0800159
 for <linux-cachefs@redhat.com>; Tue,  8 Nov 2022 03:28:50 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-571-Fs8FFVQFOcaah8T3IQjNkA-4; Mon, 07 Nov 2022 22:28:48 -0500
X-MC-Unique: Fs8FFVQFOcaah8T3IQjNkA-4
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VUHTXsX_1667878119
Received: from 30.221.131.213(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VUHTXsX_1667878119) by smtp.aliyun-inc.com;
 Tue, 08 Nov 2022 11:28:41 +0800
Message-ID: <f0627b05-1f51-8683-75ad-17e5899efb2b@linux.alibaba.com>
Date: Tue, 8 Nov 2022 11:28:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: David Howells <dhowells@redhat.com>, willy@infradead.org
References: <166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH v2 1/2] netfs: Fix missing xas_retry()
 calls in xarray iteration
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
Cc: linux-fsdevel@vger.kernel.org, George Law <glaw@redhat.com>,
 linux-cachefs@redhat.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/5/22 12:37 AM, David Howells wrote:
> netfslib has a number of places in which it performs iteration of an xarray
> whilst being under the RCU read lock.  It *should* call xas_retry() as the
> first thing inside of the loop and do "continue" if it returns true in case
> the xarray walker passed out a special value indicating that the walk needs
> to be redone from the root[*].
> 
> Fix this by adding the missing retry checks.
> 
> [*] I wonder if this should be done inside xas_find(), xas_next_node() and
>     suchlike, but I'm told that's not an simple change to effect.
> 
> This can cause an oops like that below.  Note the faulting address - this
> is an internal value (|0x2) returned from xarray.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000402
> ...
> RIP: 0010:netfs_rreq_unlock+0xef/0x380 [netfs]
> ...
> Call Trace:
>  netfs_rreq_assess+0xa6/0x240 [netfs]
>  netfs_readpage+0x173/0x3b0 [netfs]
>  ? init_wait_var_entry+0x50/0x50
>  filemap_read_page+0x33/0xf0
>  filemap_get_pages+0x2f2/0x3f0
>  filemap_read+0xaa/0x320
>  ? do_filp_open+0xb2/0x150
>  ? rmqueue+0x3be/0xe10
>  ceph_read_iter+0x1fe/0x680 [ceph]
>  ? new_sync_read+0x115/0x1a0
>  new_sync_read+0x115/0x1a0
>  vfs_read+0xf3/0x180
>  ksys_read+0x5f/0xe0
>  do_syscall_64+0x38/0x90
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
> Reported-by: George Law <glaw@redhat.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> cc: Matthew Wilcox <willy@infradead.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> ---

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

