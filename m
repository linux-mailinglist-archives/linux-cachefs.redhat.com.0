Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5155A49C388
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 Jan 2022 07:16:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-9KFHVvvQNOqS-Dw3SQmZjA-1; Wed, 26 Jan 2022 01:16:15 -0500
X-MC-Unique: 9KFHVvvQNOqS-Dw3SQmZjA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 193B2814245;
	Wed, 26 Jan 2022 06:16:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A25D4DC06;
	Wed, 26 Jan 2022 06:16:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7422A4BB7C;
	Wed, 26 Jan 2022 06:16:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20Q6G73R005586 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 01:16:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D9708401E8D; Wed, 26 Jan 2022 06:16:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5551401E6A
	for <linux-cachefs@redhat.com>; Wed, 26 Jan 2022 06:16:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B723780B707
	for <linux-cachefs@redhat.com>; Wed, 26 Jan 2022 06:16:07 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-221-YSDchs8UPWaHneYt4KeRew-1; Wed, 26 Jan 2022 01:16:05 -0500
X-MC-Unique: YSDchs8UPWaHneYt4KeRew-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V2uAg.f_1643177453
Received: from 30.225.24.77(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2uAg.f_1643177453) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 26 Jan 2022 14:10:55 +0800
Message-ID: <8f88459a-97e0-8b8d-3ec9-260d482a0d38@linux.alibaba.com>
Date: Wed, 26 Jan 2022 14:10:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: David Howells <dhowells@redhat.com>
References: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
	<2815558.1643127330@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <2815558.1643127330@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	xiang@kernel.org, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v2 00/20] fscache,
 erofs: fscache-based demand-read semantics
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/26/22 12:15 AM, David Howells wrote:
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
>> The following issues still need further discussion. Thanks for your time
>> and patience.
>>
>> 1. I noticed that there's refactoring of netfs library[1],
>> ...
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=netfs-lib
> 
> Yes.  I'm working towards getting netfslib to do handling writes and dio as
> well as reads, along with content crypto/compression, and the idea I'm aiming
> towards is that you just point your address_space_ops at netfs directly if
> possible - but it's going to require its own context now to manage pending
> writes.
> 
> See my netfs-experimental branch for more of that - it's still a work in
> progress, though.

Got it.

> 
> Btw, you could set rreq->netfs_priv in ->init_rreq() rather than passing it in
> to netfs_readpage().
> 
>> 2. The current implementation will severely conflict with the
>> refactoring of netfs library[1][2]. The assumption of 'struct
>> netfs_i_context' [2] is that, every file in the upper netfs will
>> correspond to only one backing file. While in our scenario, one file in
>> erofs can correspond to multiple backing files. That is, the content of
>> one file can be divided into multiple chunks, and are distrubuted over
>> multiple blob files, i.e. multiple backing files. Currently I have no
>> good idea solving this conflic.
> 
> I can think of a couple of options to explore:
> 
>  (1) Duplicate the cachefiles backend.  You can discard a lot of it, since a
>      much of it is concerned with managing local modifications - which you're
>      not going to do since you have a R/O filesystem and you're looking at
>      importing files into the cache externally to the kernel.
> 


>      I would suggest looking to see if you can do the blob mapping in the
>      backend rather than passing the offset down.  Maybe make the cookie index
>      key hold the index too, e.g. "/path/to/file+offset".

Have been discussed in [1].

[1]
https://lore.kernel.org/lkml/Yeeye2AUZITDsdh8@B-P7TQMD6M-0146.local/T/#m25b1229f96bf24929fb73746a07e9996e8222ac6


"/path/to/file+offset"
		^

Besides, what does the 'offset' mean?


> 
>      Btw, do you still need cachefilesd for its culling duties?

Yes we still need cache management in this on-demand scenario, in case
of backing files exhausting the available blocks. (Though these backing
files are prepared by daemon in advance, these files can all be sparse
files.) And similarly the actual culling work should be done under
protection of S_KERNEL_FILE, so that the culled backing file can't be
picked back up.

> 
>  (2) Do you actually need to go through netfslib?  Might it be easier to call
>      fscache_read() directly?  Have a look at fs/nfs/fscache.c

It would be great if we can use fscache_read() directly.


> 
>> Besides there are still two quetions:
>> - What's the plan of [1]? When is it planned to be merged?
> 
> Hopefully next merge window, but that's going to depend on a number of things.
> 
>> - It seems that all upper fs using fscache is going to use netfs API,
>>   while the APIs like fscache_read_or_alloc_page() are deprecated. Is
>>   that true?
> 
> fscache_read_or_alloc_page() is gone completely.
> 
> You don't have to use the netfs API.  You can talk to fscache directly,
> doing DIO from the cache to an xarray-class iov_iter constructed from your
> inode's pagecache.
> 
> netfslib provides/will provide a number of services, such as multipage
> folios, transparent caching, crypto, compression and hiding the existence of
> pages/folios from the filesystem as entirely as possible.  However, you
> already have some of these implemented on top of iomap for the blockdev
> interface, it would appear.
> 

Got it.


In summary,

1) I prefer option 2, i.e. calling fscache_read() directly, as the one
at hand. In this case, the conflict with the netfs lib refactoring can
be avoided. Besides, there will be less modification needed to
cachefiles/netfs. Patch 1~3 are no longer required, while patch 4~6 are
still needed, which mainly introduce the new devnode.

2) Later we can change to option 1, i.e. calling netfs lib and also a
potential new R/O backend, if the issues in [1] can be clarified or solved.

[1]
https://lore.kernel.org/lkml/Yeeye2AUZITDsdh8@B-P7TQMD6M-0146.local/T/#m25b1229f96bf24929fb73746a07e9996e8222ac6

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

