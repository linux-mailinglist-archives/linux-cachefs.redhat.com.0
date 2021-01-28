Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 17989307FDF
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Jan 2021 21:51:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-wxwnUUT4MXCPZzzOtc-peg-1; Thu, 28 Jan 2021 15:51:38 -0500
X-MC-Unique: wxwnUUT4MXCPZzzOtc-peg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BEC1107ACE4;
	Thu, 28 Jan 2021 20:51:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E9B1A919;
	Thu, 28 Jan 2021 20:51:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B010F1809C9F;
	Thu, 28 Jan 2021 20:51:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SKmvtG015695 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 15:48:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0909BF49A1; Thu, 28 Jan 2021 20:48:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02E4AF4EBE
	for <linux-cachefs@redhat.com>; Thu, 28 Jan 2021 20:48:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEF30187504B
	for <linux-cachefs@redhat.com>; Thu, 28 Jan 2021 20:48:54 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-KnNxZQEfN4OaDyW78vna3Q-1; Thu, 28 Jan 2021 15:48:50 -0500
X-MC-Unique: KnNxZQEfN4OaDyW78vna3Q-1
Received: by mail-io1-f53.google.com with SMTP id e22so7021151iog.6;
	Thu, 28 Jan 2021 12:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qdoEjK6WmyZe9D8sv9PM+Lkh5UShPE1H2BMAI6rL4mM=;
	b=B1OdcCEzpuCEjf0ppUiXn1m5qQxUJSW1PmHGWIKRMzkNRRADHCV6M6ka4g4XMN0WKJ
	AVTc9AnnMc7slaeJb4C5KmbPJAzT73SgXJs4CaDqEz7fghJQZ5amqS8jFUUQfJPCqnGi
	jaUCXld7Pa2TKmtFLWs8m6m8/jidL/xjTb5harnUSrsiAXAtPbkL8imX7RNO7PxDhlPf
	0cm9Boz5qNUYlU/leE0fE+yIQ1kHn0uUUHQDp9fBkq/Br8Bfhf23ptKfNTloqvdqgKHR
	YAGqKeYmDPLf9T27QM0DJDurkguH1CF41zKsps0CC+mqNYCmlwHAWhvffVZyjGvq8D6b
	RnUw==
X-Gm-Message-State: AOAM531c65vzN84kLsIUW6I+dxYf4wxgqX5uVpAhip8/os+BDguOJTTB
	s5R5Gv7LVLSYN4n2Dd5qwZBMKj73Aa6onwN1fAc=
X-Google-Smtp-Source: ABdhPJwEfQfxpnmTaXxKdFQhLhUuZKcJjUgIqb4XWB6FsQSdQVE00jXzdZ/moiHqw0bN9zCv9h/LM28RVuL5Uoy9YRA=
X-Received: by 2002:a6b:2bca:: with SMTP id r193mr1102442ior.167.1611866929271;
	Thu, 28 Jan 2021 12:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20210126134103.240031-1-jlayton@kernel.org>
	<CAOi1vP-3Ma4LdCcu6sPpwVbmrto5HnOAsJ6r9_973hYY3ODBUQ@mail.gmail.com>
	<2301cde67ae7aa54d860fc3962aeb8ed85744c75.camel@kernel.org>
In-Reply-To: <2301cde67ae7aa54d860fc3962aeb8ed85744c75.camel@kernel.org>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 28 Jan 2021 21:48:44 +0100
Message-ID: <CAOi1vP_7dfuKgQxFpyeUDMJBGm=cnQSvYHDnU=6YPTzbB9+d6w@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ceph Development <ceph-devel@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH 0/6] ceph: convert to new netfs read
	helpers
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 28, 2021 at 1:52 PM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Wed, 2021-01-27 at 23:50 +0100, Ilya Dryomov wrote:
> > On Tue, Jan 26, 2021 at 2:41 PM Jeff Layton <jlayton@kernel.org> wrote:
> > >
> > > This patchset converts ceph to use the new netfs readpage, write_begin,
> > > and readahead helpers to handle buffered reads. This is a substantial
> > > reduction in code in ceph, but shouldn't really affect functionality in
> > > any way.
> > >
> > > Ilya, if you don't have any objections, I'll plan to let David pull this
> > > series into his tree to be merged with the netfs API patches themselves.
> >
> > Sure, that works for me.
> >
> > I would have expected that the new netfs infrastructure is pushed
> > to a public branch that individual filesystems could peruse, but since
> > David's set already includes patches for AFS and NFS, let's tag along.
> >
> > Thanks,
> >
> >                 Ilya
>
> David has a fscache-netfs-lib branch that has all of the infrastructure
> changes. See:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-netfs-lib

I saw that, but AFAICS it hasn't been declared public (as in suitable
for other people to base their work on, with the promise that history
won't get rewritten.  It is branched off of what looks like a random
snapshot of Linus' tree instead of a release point, etc.

Thanks,

                Ilya

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

