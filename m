Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E978D415
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=slR4byes6tEwbUYWmfzythL/sp3ndMf1OiuQzkDXspM=;
	b=CoeB2XjkV1/OT+VCQ8IGIBzdPUkxttgncGnaDCRpvhNKalqtMgON3CVGD7s1n3xty5PK95
	gU1mgOv+DHfn3923o70glv5LBEWIsbIbdihusRXp1adiXLaqP1nKVbCEm1Pai1ELTATRv8
	FUao8RxZg7X9w7Sy9uFOpRbAHNu/TEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-yNJDmNiHM_C3v2tFjYqebg-1; Wed, 30 Aug 2023 04:24:11 -0400
X-MC-Unique: yNJDmNiHM_C3v2tFjYqebg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 360ED800CA8;
	Wed, 30 Aug 2023 08:24:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D6261121315;
	Wed, 30 Aug 2023 08:24:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 09D951946A47;
	Wed, 30 Aug 2023 08:24:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2680619465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 06:17:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E386A140E96F; Wed, 30 Aug 2023 06:17:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3DC140E96E
 for <linux-cachefs@redhat.com>; Wed, 30 Aug 2023 06:17:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF0BD80027F
 for <linux-cachefs@redhat.com>; Wed, 30 Aug 2023 06:17:33 +0000 (UTC)
Received: from out-246.mta0.migadu.com (out-246.mta0.migadu.com
 [91.218.175.246]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-MvXsXqbrPkmD7Kpe9hPTUQ-1; Wed, 30 Aug 2023 02:17:31 -0400
X-MC-Unique: MvXsXqbrPkmD7Kpe9hPTUQ-1
Message-ID: <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
Date: Wed, 30 Aug 2023 14:11:31 +0800
MIME-Version: 1.0
To: Matthew Wilcox <willy@infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <ZO3cI+DkotHQo3md@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: Re: [Linux-cachefs] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 8/29/23 19:53, Matthew Wilcox wrote:
> On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
>> On 8/28/23 05:32, Matthew Wilcox wrote:
>>> On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
>>>> From: Hao Xu <howeyxu@tencent.com>
>>>>
>>>> Add a boolean parameter for file_accessed() to support nowait semantics.
>>>> Currently it is true only with io_uring as its initial caller.
>>>
>>> So why do we need to do this as part of this series?  Apparently it
>>> hasn't caused any problems for filemap_read().
>>>
>>
>> We need this parameter to indicate if nowait semantics should be enforced in
>> touch_atime(), There are locks and maybe IOs in it.
> 
> That's not my point.  We currently call file_accessed() and
> touch_atime() for nowait reads and nowait writes.  You haven't done
> anything to fix those.
> 
> I suspect you can trim this patchset down significantly by avoiding
> fixing the file_accessed() problem.  And then come back with a later
> patchset that fixes it for all nowait i/o.  Or do a separate prep series

I'm ok to do that.

> first that fixes it for the existing nowait users, and then a second
> series to do all the directory stuff.
> 
> I'd do the first thing.  Just ignore the problem.  Directory atime
> updates cause I/O so rarely that you can afford to ignore it.  Almost
> everyone uses relatime or nodiratime.

Hi Matthew,
The previous discussion shows this does cause issues in real
producations: 
https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

