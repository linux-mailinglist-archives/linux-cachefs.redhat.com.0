Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5B38930AB2D
	for <lists+linux-cachefs@lfdr.de>; Mon,  1 Feb 2021 16:26:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612193163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=24DAedcXh+DycI1MPVL0rq9PMFQCxCfgvLE6w6gJPiI=;
	b=UQlNGp+3zCtTpsUS6I2j73VldUnDc0L/Me4zT7AtKRO7QKe4efGzukcjD7LSYs4tEFWQtu
	0LimxOMh7+2YG3g+6ihyhH2rghNw4Gov+3ZqxImKNoJLT0wwPy69DMM0HbOKFA+FtgS1Lb
	9Wd1hBjTE5c0D/cfvOl5NOWhzx3Le9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-JmcdCAVrO-OTGNdKt_4kKw-1; Mon, 01 Feb 2021 10:25:59 -0500
X-MC-Unique: JmcdCAVrO-OTGNdKt_4kKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 533FE801AC2;
	Mon,  1 Feb 2021 15:25:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DEA15D9DC;
	Mon,  1 Feb 2021 15:25:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D713950038;
	Mon,  1 Feb 2021 15:25:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 111FPmVo008598 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 10:25:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF43C5D735; Mon,  1 Feb 2021 15:25:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D2425D749;
	Mon,  1 Feb 2021 15:25:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAOi1vP_7dfuKgQxFpyeUDMJBGm=cnQSvYHDnU=6YPTzbB9+d6w@mail.gmail.com>
References: <CAOi1vP_7dfuKgQxFpyeUDMJBGm=cnQSvYHDnU=6YPTzbB9+d6w@mail.gmail.com>
	<20210126134103.240031-1-jlayton@kernel.org>
	<CAOi1vP-3Ma4LdCcu6sPpwVbmrto5HnOAsJ6r9_973hYY3ODBUQ@mail.gmail.com>
	<2301cde67ae7aa54d860fc3962aeb8ed85744c75.camel@kernel.org>
To: Ilya Dryomov <idryomov@gmail.com>
MIME-Version: 1.0
Date: Mon, 01 Feb 2021 15:25:43 +0000
Message-ID: <4171610.1612193143@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 111FPmVo008598
X-loop: linux-cachefs@redhat.com
Cc: Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <4171609.1612193143.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ilya Dryomov <idryomov@gmail.com> wrote:

> > David has a fscache-netfs-lib branch that has all of the infrastructure
> > changes. See:
> >
> >     https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-netfs-lib
> 
> I saw that, but AFAICS it hasn't been declared public (as in suitable
> for other people to base their work on, with the promise that history
> won't get rewritten.

My intention to avoid modifying it further, except for extra fix patches
stacked on the end if necessary, as I want to try to avoid jinxing it from
getting pulled in the next merge window.

> It is branched off of what looks like a random snapshot of Linus' tree
> instead of a release point, etc.

Yeah, sorry about that.  I took what was current linus/master at the time I
cut the branch with the intention of trying to get it into linux-next before
-rc5 was tagged (ie. >3 weeks before the merge window), but including the
X.509 crash fix.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

