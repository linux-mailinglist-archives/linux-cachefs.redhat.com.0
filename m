Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6949C33A
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 Jan 2022 06:28:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-WWhWo3y3PCepquAKTJMvuw-1; Wed, 26 Jan 2022 00:28:02 -0500
X-MC-Unique: WWhWo3y3PCepquAKTJMvuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CB1F1006AA5;
	Wed, 26 Jan 2022 05:28:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2EC51042B7F;
	Wed, 26 Jan 2022 05:27:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B701A1809CB8;
	Wed, 26 Jan 2022 05:27:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20Q5QiIe002730 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 00:26:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6FE2F1120ABD; Wed, 26 Jan 2022 05:26:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB0F112133E
	for <linux-cachefs@redhat.com>; Wed, 26 Jan 2022 05:26:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72A4C296A603
	for <linux-cachefs@redhat.com>; Wed, 26 Jan 2022 05:26:41 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-197-OQ1n-7iVO6KfSC90i4lhwA-1; Wed, 26 Jan 2022 00:26:38 -0500
X-MC-Unique: OQ1n-7iVO6KfSC90i4lhwA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V2tupFr_1643174792
Received: from 30.225.24.77(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V2tupFr_1643174792) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 26 Jan 2022 13:26:33 +0800
Message-ID: <2946d871-b9e1-cf29-6d39-bcab30f2854f@linux.alibaba.com>
Date: Wed, 26 Jan 2022 13:26:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: David Howells <dhowells@redhat.com>
References: <2815558.1643127330@warthog.procyon.org.uk>
	<20220118131216.85338-1-jefflexu@linux.alibaba.com>
	<3116562.1643142458@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <3116562.1643142458@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/26/22 4:27 AM, David Howells wrote:
> David Howells <dhowells@redhat.com> wrote:
> 
>>  (1) Duplicate the cachefiles backend.  You can discard a lot of it, since a
>>      much of it is concerned with managing local modifications - which you're
>>      not going to do since you have a R/O filesystem and you're looking at
>>      importing files into the cache externally to the kernel.
> 
> Take the attached as a start.  It's completely untested.  I've stripped out
> anything to do with writing to the cache, making directories, etc. as that can
> probably be delegated to the on-demand creation.  You could drive on-demand
> creation from the points where it would create files.  I've put some "TODO"
> comments in there as markers.

Thanks for your inspiring work. Some questions below.

> 
> You could also strip out everything to do with invalidation and also make it
> just fail if it encounters a file type that it doesn't like or a file that is
> not correctly labelled for a coherency attribute.
> 
> Also, since you aren't intending to write anything or create new files here,
> there's no need to do the space checking - so I've got rid of all that too.
> 
> I've also made it open the backing files read only and got rid of the trimming
> to I/O blocksize for DIO purposes.  The userspace side can take care of that -
> and, besides, you want to have multiple files within a backing file, right?
> 
> You might want to stop it from marking cache *files* in use (but only mark
> directories).  It doesn't matter so much as you aren't going to get coherency
> issues from having multiple writers to the same file.
> 


> You then need to add a file offset member to the erofscache_object struct, set
> that when the backing file is looked up and add it to the file position in
> erofscache_read().  You also need to look at erofscache_prepare_read().  If
> your files are contiguous complete blobs, that can be a lot simpler.

To be honest, I'm not sure if I get your points correctly. Do you mean
each file in erofs has only one chunk (and thus corresponds to only one
backing blob file), so that netfs lib can work well while given the only
cookie associated with the netfs file?

By the way, let me explain the blob mapping in erofs further. To
implement deduplication, one erofs file can be divided into multiple
chunks, while these chunks can be distributed over several backing blob
files quite randomly (rather than a round-robin style). Each erofs file
maintains an on-disk map describing the mapping relationship between
chunks and backing blob files. Something like the extent map. Thus
there's a multi-to-multi relationship between erofs file and backing
blob file.

Thus each erofs file can correspond to multiple cookies in this way,
i.e. one 'struct netfs_i_context' can correspond to multiple cookies.
Besides, the mapping relationship between chunks and backing blob files
is totally implemented in upper fs (i.e. erofs), I have no idea how we
can "do the blob mapping in the backend" [1]. So I don't think we can
use netfs lib **directly** even with this R/O fscache backend
implemented. Please correct me if I misunderstand it.


[1]
https://lore.kernel.org/lkml/Yeeye2AUZITDsdh8@B-P7TQMD6M-0146.local/T/#mfbb2053476760d8fac723c57dad529192a5084c6


Besides, IMHO it may suffer great challenges when implementing a new R/O
backend, since there's quite many code duplication. I know it's just a
starting version from scratch, but I'm not sure if it's worth it.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

