Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644D79A07C
	for <lists+linux-cachefs@lfdr.de>; Mon, 11 Sep 2023 00:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694383296;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7MY5V0pXGqqh2a9ec06WutgaFHMGdczY2G8Rlwfrqbw=;
	b=ROXZgxezbfZ9cM551KrjiYEY0WKZPGq0aCzs97LJ9yZfYQlYKKnN/dJKFxXZDk9n4OKUya
	hERtrnbnqnrp4qzjCY2tNr9hTqMXKkIi8ruV8gvUAn+oqVZS8zG76hQNqFSD9MzHwfq/K4
	fjpv0d60s+FA4EBXEMxEBu8cpfidLME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-L4bS90apMeqOqfoENyctdQ-1; Sun, 10 Sep 2023 18:01:35 -0400
X-MC-Unique: L4bS90apMeqOqfoENyctdQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D38A8101FAA0;
	Sun, 10 Sep 2023 22:01:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C70349310E;
	Sun, 10 Sep 2023 22:01:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 49EF119465B1;
	Sun, 10 Sep 2023 22:01:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 279831946597 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 10 Sep 2023 22:01:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05A83400E88; Sun, 10 Sep 2023 22:01:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2450493112
 for <linux-cachefs@redhat.com>; Sun, 10 Sep 2023 22:01:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0F469259E1
 for <linux-cachefs@redhat.com>; Sun, 10 Sep 2023 22:01:30 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-0jK-qJXfN8C8HwYX24HX5g-1; Sun, 10 Sep 2023 18:01:28 -0400
X-MC-Unique: 0jK-qJXfN8C8HwYX24HX5g-1
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-68c576d35feso3658716b3a.2
 for <linux-cachefs@redhat.com>; Sun, 10 Sep 2023 15:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694383288; x=1694988088;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EyybjuBSw2AsBAibBPVqGccWs6P0JtTeGBB0Kwx90Dw=;
 b=XmkoJCIA01+zouSvuEEQX+AmMGvUaLx4B4FwVfiuRX0kWpy7UjXI0Kdu3UsXkh2ZDJ
 h2waW0WVmT1Uuo6D8Nn4rlcYfwbbJu7nPBxad8f0lMXT49NsBz+QfNu1lY+36xiOekbU
 +IyFnXAn1UdGUUm4QByggZVphC0ISgYpoo+rE9uz/gAB6F0EYS33630BdkaDlzrSUZIa
 T3YgbOqxXhWQkWVz+diaD70iN8DTjv+ChdAiyCp06VizC2mCaPIGFQDU6pPSDdOBc62b
 KdGSHQAy+60IW1zSed8VPs/8vbXIkA5bSLILwBOsHFJNq3ewTb+1wR0lb2krKmo86iZv
 ZbbQ==
X-Gm-Message-State: AOJu0YwYKmW8yFWYlPZV3kuZ4WdlrpmkA6lIKTtkF+vY1HkzoDYqHeb8
 /H6NE3vRgPtfCHgtiEz0YMxiUU0+KTHIPyGbrxk=
X-Google-Smtp-Source: AGHT+IHSYFPf3w2qdTZr9bikkzuSsvPYQjYYZyW+Zfc616rQWXs3Eeo2BzwinmhhOfJVOtnHj1lBTA==
X-Received: by 2002:a05:6a00:1a0c:b0:68c:57c7:1eb0 with SMTP id
 g12-20020a056a001a0c00b0068c57c71eb0mr9371853pfv.11.1694383287795; 
 Sun, 10 Sep 2023 15:01:27 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 u10-20020a62ed0a000000b0068a3dd6c1dasm4403641pfh.142.2023.09.10.15.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Sep 2023 15:01:27 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qfSUe-00DWBA-0u;
 Mon, 11 Sep 2023 08:01:24 +1000
Date: Mon, 11 Sep 2023 08:01:24 +1000
From: Dave Chinner <david@fromorbit.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <ZP48tAg2iS0UzKQf@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
 <ZPUJHAKzxvXiEDYA@dread.disaster.area>
 <6489b8cb-7d54-1e29-f192-a3449ed87fa1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6489b8cb-7d54-1e29-f192-a3449ed87fa1@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 Dominique Martinet <asmadeus@codewreck.org>, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-cachefs@redhat.com, linux-ext4@vger.kernel.org,
 Hao Xu <hao.xu@linux.dev>, linux-cifs@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 08, 2023 at 01:29:55AM +0100, Pavel Begunkov wrote:
> On 9/3/23 23:30, Dave Chinner wrote:
> > On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
> > > On 8/29/23 19:53, Matthew Wilcox wrote:
> > > > On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
> > > > > On 8/28/23 05:32, Matthew Wilcox wrote:
> > > > > > On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> > > > > > > From: Hao Xu <howeyxu@tencent.com>
> > > > > > > 
> > > > > > > Add a boolean parameter for file_accessed() to support nowait semantics.
> > > > > > > Currently it is true only with io_uring as its initial caller.
> > > > > > 
> > > > > > So why do we need to do this as part of this series?  Apparently it
> > > > > > hasn't caused any problems for filemap_read().
> > > > > > 
> > > > > 
> > > > > We need this parameter to indicate if nowait semantics should be enforced in
> > > > > touch_atime(), There are locks and maybe IOs in it.
> > > > 
> > > > That's not my point.  We currently call file_accessed() and
> > > > touch_atime() for nowait reads and nowait writes.  You haven't done
> > > > anything to fix those.
> > > > 
> > > > I suspect you can trim this patchset down significantly by avoiding
> > > > fixing the file_accessed() problem.  And then come back with a later
> > > > patchset that fixes it for all nowait i/o.  Or do a separate prep series
> > > 
> > > I'm ok to do that.
> > > 
> > > > first that fixes it for the existing nowait users, and then a second
> > > > series to do all the directory stuff.
> > > > 
> > > > I'd do the first thing.  Just ignore the problem.  Directory atime
> > > > updates cause I/O so rarely that you can afford to ignore it.  Almost
> > > > everyone uses relatime or nodiratime.
> > > 
> > > Hi Matthew,
> > > The previous discussion shows this does cause issues in real
> > > producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
> > > 
> > 
> > Then separate it out into it's own patch set so we can have a
> > discussion on the merits of requiring using noatime, relatime or
> > lazytime for really latency sensitive IO applications. Changing code
> > is not always the right solution...
> 
> Separation sounds reasonable, but it can hardly be said that only
> latency sensitive apps would care about >1s nowait/async submission
> delays. Presumably, btrfs can improve on that, but it still looks
> like it's perfectly legit for filesystems do heavy stuff in
> timestamping like waiting for IO. Right?

Yes, it is, no-one is denying that. And some filesystems are worse
than others, but none of that means it has to be fixed so getdents
can be converted to NOWAIT semantics.

ie. this patchset is about the getdents NOWAIT machinery, and
fiddling around with timestamps has much, much wider scope than just
NOWAIT getdents machinery. We'll have this discussion about NOWAIT
timestamp updates when a RFC is proposed to address the wider
problem of how timestamp updates should behave in NOWAIT context.

-Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

