Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4F790EF2
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Sep 2023 00:31:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-t1XpvEyXOvC21pLQipH3aw-1; Sun, 03 Sep 2023 18:31:02 -0400
X-MC-Unique: t1XpvEyXOvC21pLQipH3aw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1434729A9D3F;
	Sun,  3 Sep 2023 22:31:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CAD2C02996;
	Sun,  3 Sep 2023 22:31:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D803C19465A0;
	Sun,  3 Sep 2023 22:30:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0CFBB1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Sun,  3 Sep 2023 22:30:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9AF24141D963; Sun,  3 Sep 2023 22:30:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92AA0141D962
 for <linux-cachefs@redhat.com>; Sun,  3 Sep 2023 22:30:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73FE5925FC2
 for <linux-cachefs@redhat.com>; Sun,  3 Sep 2023 22:30:57 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-8xX_qapJPOCnkOjmEsOHjQ-1; Sun, 03 Sep 2023 18:30:55 -0400
X-MC-Unique: 8xX_qapJPOCnkOjmEsOHjQ-1
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1c4cf775a14so781417fac.3
 for <linux-cachefs@redhat.com>; Sun, 03 Sep 2023 15:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693780255; x=1694385055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nv6YpToDNZJcA/Ccz8YHJKQ8zE37n7OYKvDh05ivZ8M=;
 b=bT/ljr5dPNqn+NqIKpRbkFXBTFF3pdmNLVuKl1uKc4MtCEihgdp1XVsMpDI1jLD4QK
 UYsZypA+tGgR2/812SKtjbUxJF+FzzYAmtPFKZ/utMmZpIXdnSMzbPe6UqT5CYXZw7kX
 4Ox9XqH3/zYrab0L8ilHC9GWvAqUYe27sLZo39taU0/SnzUq0ocH8yz6BZWCK95BjjdX
 PPnSht2BRogH2gp46OIox6tVWuvq/fW+v7xCez3dBk7OksYsiNuWPG2YqkZxUf9ywQJ/
 kUiZKeYcjkOQ+4wRt5eFKL0Ty2X0DHE96T592Ueld5xqgj+kjpIiVAcNlVJSVDlOs30Z
 /jHA==
X-Gm-Message-State: AOJu0YzA9aJ7rxrXD+PBEJLRXlekinbDbRSaTdwE7PoxJXgpy/xYBBdM
 hmJPIm+oYyndEB9UhbikGYU6Sg==
X-Google-Smtp-Source: AGHT+IGLu9Ypqvz2HQH6Ke2apJHDtGTD5ZHmV6+9u1MT+8XuCmbNG2jkA6AQg79Zc5mY+kWQOWShIA==
X-Received: by 2002:a05:6870:568d:b0:1be:c8e2:3ec3 with SMTP id
 p13-20020a056870568d00b001bec8e23ec3mr11536784oao.14.1693780255066; 
 Sun, 03 Sep 2023 15:30:55 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 i15-20020a63bf4f000000b00565e96d9874sm5648132pgo.89.2023.09.03.15.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 15:30:54 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qcvcK-00ASFy-0F;
 Mon, 04 Sep 2023 08:30:52 +1000
Date: Mon, 4 Sep 2023 08:30:52 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZPUJHAKzxvXiEDYA@dread.disaster.area>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
 <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
MIME-Version: 1.0
In-Reply-To: <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 cluster-devel@redhat.com, linux-cachefs@redhat.com, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 30, 2023 at 02:11:31PM +0800, Hao Xu wrote:
> On 8/29/23 19:53, Matthew Wilcox wrote:
> > On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
> > > On 8/28/23 05:32, Matthew Wilcox wrote:
> > > > On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> > > > > From: Hao Xu <howeyxu@tencent.com>
> > > > > 
> > > > > Add a boolean parameter for file_accessed() to support nowait semantics.
> > > > > Currently it is true only with io_uring as its initial caller.
> > > > 
> > > > So why do we need to do this as part of this series?  Apparently it
> > > > hasn't caused any problems for filemap_read().
> > > > 
> > > 
> > > We need this parameter to indicate if nowait semantics should be enforced in
> > > touch_atime(), There are locks and maybe IOs in it.
> > 
> > That's not my point.  We currently call file_accessed() and
> > touch_atime() for nowait reads and nowait writes.  You haven't done
> > anything to fix those.
> > 
> > I suspect you can trim this patchset down significantly by avoiding
> > fixing the file_accessed() problem.  And then come back with a later
> > patchset that fixes it for all nowait i/o.  Or do a separate prep series
> 
> I'm ok to do that.
> 
> > first that fixes it for the existing nowait users, and then a second
> > series to do all the directory stuff.
> > 
> > I'd do the first thing.  Just ignore the problem.  Directory atime
> > updates cause I/O so rarely that you can afford to ignore it.  Almost
> > everyone uses relatime or nodiratime.
> 
> Hi Matthew,
> The previous discussion shows this does cause issues in real
> producations: https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write
> 

Then separate it out into it's own patch set so we can have a
discussion on the merits of requiring using noatime, relatime or
lazytime for really latency sensitive IO applications. Changing code
is not always the right solution...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

