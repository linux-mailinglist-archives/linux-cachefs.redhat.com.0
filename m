Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A737891FF
	for <lists+linux-cachefs@lfdr.de>; Sat, 26 Aug 2023 00:53:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693004019;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0rh7Jl2i3HfPUwalYAkRHIfJ71BFoei4zBCIIi9G3Sc=;
	b=R/4DmCo7QyT0Df4/+m+TDYg3lk626H4X04+859VwDImuMnNDDh/PP4QxhFdi8UbM7cpNmx
	+k0vP0Gqt7gY5r4yzdOQWa4vTpu3rVTPQBhGTVmtZoJWYnDT2FDwox13Y5G0Vu/W0cZCM3
	nzSp1l0O6mwSUfE9k1GWFj2vFuz9IjE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-fZEsPX4sOJ-MYjxVAh58Hg-1; Fri, 25 Aug 2023 18:53:38 -0400
X-MC-Unique: fZEsPX4sOJ-MYjxVAh58Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D2A5101A53C;
	Fri, 25 Aug 2023 22:53:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD89E2026D76;
	Fri, 25 Aug 2023 22:53:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 572A819465B3;
	Fri, 25 Aug 2023 22:53:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7FF3119465B1 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4AAA040C2079; Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 375B340C2073
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B7018D40A1
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-8gghaQ6CNCu9ZpSIpNwOSQ-1; Fri, 25 Aug 2023 18:53:33 -0400
X-MC-Unique: 8gghaQ6CNCu9ZpSIpNwOSQ-1
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-68bed8de5b9so1154974b3a.3
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693004012; x=1693608812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUz0mvDJOC9uQjgg5Uba361PK/6ticcfnjAOo3qTtYA=;
 b=RtjayZvyZ3j+gs5MlVpGs8WHKZRc/tpbwlI10CJpubx0FAAPFjHdgyNMcrJCxFCkmc
 FwkoqYlvPsN1hNIuLGAbzNXAhFAnEjmS+B6Cd0zAooh10Pvqu6ZVSRy4ey4Zm1y8LkbI
 71vV40yjVAitxrM4GAXfKqKhiaxErLWcYbEgWkbqrYuUHCe3pUB7ZLtIg8utQRzzzv5e
 1SV2hU51U9XVrZp+x1emotouWKvmP6ajq8YFzOfiYoU4S1WTNGlqUhD2RVykxaYZ4YL/
 RCHqSFC8NAx0zgt4Kk2d5XU/IKkV4LNBmduDv5zk9tF15BGHUYpq49T2OcLTwtj3Lntv
 dErw==
X-Gm-Message-State: AOJu0Yw1/c5w59M/ZoYkIAtcuS4EVHilh0KZ7PKKookxtN2r/T1+X0S7
 9yGVp6WOBlPCQT4yh4fKXJaIFQ==
X-Google-Smtp-Source: AGHT+IF7qLruqklxY40yAH4SKvsJCnFBTQ8pg1x9p8DXB9ryPTSvbA4aGhPPBTQdBXYgxxyeFGZdhA==
X-Received: by 2002:a05:6a20:7354:b0:13d:5b8e:db83 with SMTP id
 v20-20020a056a20735400b0013d5b8edb83mr20399311pzc.9.1693004012072; 
 Fri, 25 Aug 2023 15:53:32 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b006887be16675sm2060364pfh.205.2023.08.25.15.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 15:53:31 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZfgG-006WDY-1c;
 Sat, 26 Aug 2023 08:53:28 +1000
Date: Sat, 26 Aug 2023 08:53:28 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkw6KkdP1UWPNBW@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH RFC v5 00/29] io_uring getdents
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
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 25, 2023 at 09:54:02PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> This series introduce getdents64 to io_uring, the code logic is similar
> with the snychronized version's. It first try nowait issue, and offload
> it to io-wq threads if the first try fails.
> 
> Patch1 and Patch2 are some preparation
> Patch3 supports nowait for xfs getdents code
> Patch4-11 are vfs change, include adding helpers and trylock for locks
> Patch12-29 supports nowait for involved xfs journal stuff
> note, Patch24 and 27 are actually two questions, might be removed later.
> an xfs test may come later.

You need to drop all the XFS journal stuff. It's fundamentally
broken as it stands, and we cannot support non-blocking
transactional changes without first putting a massive investment in
transaction and intent chain rollback to allow correctly undoing
partially complete modifications.

Regardless, non-blocking transactions are completely unnecessary for
a non-blocking readdir implementation. readdir should only be
touching atime, and with relatime it should only occur once every 24
hours per inode. If that's a problem, then we have noatime mount
options. Hence I just don't see any point in worrying about having a
timestamp update block occasionally...

I also don't really don't see why you need to fiddle with xfs buffer
cache semantics - it already has the functionality "nowait" buffer
reads require (i.e.  XBF_INCORE|XBF_TRYLOCK).

However, the readahead IO that the xfs readdir code issues cannot
use your defined NOWAIT semantics - it must be able to allocate
memory and issue IO. Readahead already avoids blocking on memory
allocation and blocking on IO via the XBF_READ_AHEAD flag. This sets
__GFP_NORETRY for buffer allocation and REQ_RAHEAD for IO. Hence
readahead only needs the existing XBF_TRYLOCK flag to be set to be
compatible with the required NOWAIT semantics....

As for the NOIO memory allocation restrictions io_uring requires,
that should be enforced at the io_uring layer before calling into
the VFS using memalloc_noio_save/restore.  At that point no memory
allocation will trigger IO and none of the code running under NOWAIT
conditions even needs to be aware that io_uring has a GFP_NOIO
restriction on memory allocation....

Please go back to the simple "do non-blocking buffer IO"
implementation we started with and don't try to solve every little
blocking problem that might exist in the VFS and filesystems...

-Dave
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

