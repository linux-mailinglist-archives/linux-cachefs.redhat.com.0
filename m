Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C81E73E1A5F
	for <lists+linux-cachefs@lfdr.de>; Thu,  5 Aug 2021 19:29:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-_MIeEc5_Pg-T_CDDbzZx5Q-1; Thu, 05 Aug 2021 13:29:21 -0400
X-MC-Unique: _MIeEc5_Pg-T_CDDbzZx5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 876B210066E5;
	Thu,  5 Aug 2021 17:29:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C9210016F2;
	Thu,  5 Aug 2021 17:29:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFD8D4BB7C;
	Thu,  5 Aug 2021 17:29:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 175HRVRW008075 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 5 Aug 2021 13:27:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42A1620BDB16; Thu,  5 Aug 2021 17:27:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DE2020BDB1A
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 17:27:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7896B8007B1
	for <linux-cachefs@redhat.com>; Thu,  5 Aug 2021 17:27:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-110-E9Fa0C9MMXKQiyoOU8NmxQ-1; Thu, 05 Aug 2021 13:27:25 -0400
X-MC-Unique: E9Fa0C9MMXKQiyoOU8NmxQ-1
Received: by mail-lf1-f45.google.com with SMTP id p38so12689091lfa.0
	for <linux-cachefs@redhat.com>; Thu, 05 Aug 2021 10:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kSMSzayyNT2YehjLQ2Cwc0r8HqyEvjniy8Pw7lCSffg=;
	b=qgrOR9UzBe+K6cha/QNozwrm/AyzU/Io0Ff78OJhel/qnfAoSLroaVhH4HFIhx9n7M
	CqeNYhm8SCpqFhvCIxFvJkAiabd7W0D4MpMoDQPTB8TdKBFUxO6auhC2VkW6JpgAScMU
	lgzlmb074Y+AOhv9zwbljPBe/KLl+I+TJOZ5slhDC/83kNAG4OjIQUNkTYttcR/2kF4/
	9X2Wso3SXfQF5PAOUZwAUQttdVVqX8788wEd8BhFWr6x8JqekgglnYllfSnA0mYxxEfp
	9Z2PwriDXZs71wfe8kKSjERFQwkcHdvAsI6cF4tU25HqWXU2V5eWia0B1xwurzjRlrev
	0KCg==
X-Gm-Message-State: AOAM533OXqo6NfElZd4H3XKZFoFo6IzhKUFq3SrpnxtGt4GVC5OlSt6H
	fDpcMYEVsO6IKKhGbaps7JiLRwxyRMcKIITu06s=
X-Google-Smtp-Source: ABdhPJzVtvQ0vWKUewSYulu9dno+evoWIwdH+TJEJBTgy70DBJ5Gkatzf4D+I+p7ihXZTZFDBEUHGg==
X-Received: by 2002:a05:6512:3b91:: with SMTP id
	g17mr4630920lfv.77.1628184443554; 
	Thu, 05 Aug 2021 10:27:23 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
	[209.85.167.46])
	by smtp.gmail.com with ESMTPSA id x4sm464473ljh.130.2021.08.05.10.27.21
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Aug 2021 10:27:22 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id c24so9280715lfi.11
	for <linux-cachefs@redhat.com>; Thu, 05 Aug 2021 10:27:21 -0700 (PDT)
X-Received: by 2002:a05:6512:2388:: with SMTP id
	c8mr4369071lfv.201.1628184441363; 
	Thu, 05 Aug 2021 10:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <YQv+iwmhhZJ+/ndc@casper.infradead.org>
	<YQvpDP/tdkG4MMGs@casper.infradead.org>
	<YQvbiCubotHz6cN7@casper.infradead.org>
	<1017390.1628158757@warthog.procyon.org.uk>
	<1170464.1628168823@warthog.procyon.org.uk>
	<1186271.1628174281@warthog.procyon.org.uk>
	<1219713.1628181333@warthog.procyon.org.uk>
In-Reply-To: <1219713.1628181333@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Aug 2021 10:27:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
Message-ID: <CAHk-=wjyEk9EuYgE3nBnRCRd_AmRYVOGACEjt0X33QnORd5-ig@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, Miklos Szeredi <miklos@szeredi.hu>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, Linux-MM <linux-mm@kvack.org>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] Canvassing for network filesystem write size vs
	page size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 5, 2021 at 9:36 AM David Howells <dhowells@redhat.com> wrote:
>
> Some network filesystems, however, currently keep track of which byte ranges
> are modified within a dirty page (AFS does; NFS seems to also) and only write
> out the modified data.

NFS definitely does. I haven't used NFS in two decades, but I worked
on some of the code (read: I made nfs use the page cache both for
reading and writing) back in my Transmeta days, because NFSv2 was the
default filesystem setup back then.

See fs/nfs/write.c, although I have to admit that I don't recognize
that code any more.

It's fairly important to be able to do streaming writes without having
to read the old contents for some loads. And read-modify-write cycles
are death for performance, so you really want to coalesce writes until
you have the whole page.

That said, I suspect it's also *very* filesystem-specific, to the
point where it might not be worth trying to do in some generic manner.

In particular, NFS had things like interesting credential issues, so
if you have multiple concurrent writers that used different 'struct
file *' to write to the file, you can't just mix the writes. You have
to sync the writes from one writer before you start the writes for the
next one, because one might succeed and the other not.

So you can't just treat it as some random "page cache with dirty byte
extents". You really have to be careful about credentials, timeouts,
etc, and the pending writes have to keep a fair amount of state
around.

At least that was the case two decades ago.

[ goes off and looks. See "nfs_write_begin()" and friends in
fs/nfs/file.c for some of the examples of these things, althjough it
looks like the code is less aggressive about avoding the
read-modify-write case than I thought I remembered, and only does it
for write-only opens ]

               Linus

            Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

