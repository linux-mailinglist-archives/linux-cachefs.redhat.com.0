Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D13A731A935
	for <lists+linux-cachefs@lfdr.de>; Sat, 13 Feb 2021 02:06:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-9ApHQPQ1NkOAaImKnKC9-A-1; Fri, 12 Feb 2021 20:06:23 -0500
X-MC-Unique: 9ApHQPQ1NkOAaImKnKC9-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD9B98030B7;
	Sat, 13 Feb 2021 01:06:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1834F1F426;
	Sat, 13 Feb 2021 01:06:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C61B34E58E;
	Sat, 13 Feb 2021 01:06:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11D16DtW025760 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 12 Feb 2021 20:06:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EABE8107280; Sat, 13 Feb 2021 01:06:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5909107282
	for <linux-cachefs@redhat.com>; Sat, 13 Feb 2021 01:06:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92BD9101A53A
	for <linux-cachefs@redhat.com>; Sat, 13 Feb 2021 01:06:10 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-143-k8s56aRyPomehcBVfj3mvg-1; Fri, 12 Feb 2021 20:06:08 -0500
X-MC-Unique: k8s56aRyPomehcBVfj3mvg-1
Received: by mail-lj1-f182.google.com with SMTP id v6so1158646ljh.9
	for <linux-cachefs@redhat.com>; Fri, 12 Feb 2021 17:06:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L6jTxP9hlbcUR9+3iPNQ9HmsqF25QNS6zvjTzXBH5E4=;
	b=oQoTf6CsjWSnfmPuTSec2cyskoitFQRPx57HC6R7+ZywMaSfqngfSy3rIC55dBar3O
	t+4s7qTB4Xt7GHBhKFqptXklOSbA80QSwr3CezSHBNXvNlwLg4tkBSEREAx+wtkbiXam
	0XDgN5di6ryJuSMfZtSiQF0Zhwlgo6qjgft1CBMXP66Yve/jQBxTYtJkeJVOXg55EvOh
	ECVSugHsQ80fdnptYVqIoAx2BoapLyxdVgdkXCashI+fIGcBnyr57T4q2Je5oMGrawbD
	uTeGy+s8PPJXOkFpjeu0CfE2pVtDIEo22iiBee5+PouJi2aO8ieffR3S9qiwh5Lh9MuX
	VhFg==
X-Gm-Message-State: AOAM5311mDDrzDfkOM+KKIRc+uvQBwQTZ5+5DKJ5WtJ0WJp1nejV2cyS
	4vULhKF0Q1fl1tMHSbWtmRNTo5rRr1Lu2A==
X-Google-Smtp-Source: ABdhPJypQV7KtvoSYZsHGjAo4hV2jZ2BX3pHl1X4LnLz+mDYgXtv+9amnw2DQwIjuBuDS9hc8IomGw==
X-Received: by 2002:a2e:3203:: with SMTP id y3mr2977346ljy.476.1613178366655; 
	Fri, 12 Feb 2021 17:06:06 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
	[209.85.208.177])
	by smtp.gmail.com with ESMTPSA id 29sm874881lfr.32.2021.02.12.17.06.04
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 12 Feb 2021 17:06:04 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id a17so1210974ljq.2
	for <linux-cachefs@redhat.com>; Fri, 12 Feb 2021 17:06:04 -0800 (PST)
X-Received: by 2002:a2e:8049:: with SMTP id p9mr3052102ljg.411.1613178363694; 
	Fri, 12 Feb 2021 17:06:03 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wj-k86FOqAVQ4ScnBkX3YEKuMzqTEB2vixdHgovJpHc9w@mail.gmail.com>
	<591237.1612886997@warthog.procyon.org.uk>
	<1330473.1612974547@warthog.procyon.org.uk>
	<1330751.1612974783@warthog.procyon.org.uk>
	<CAHk-=wjgA-74ddehziVk=XAEMTKswPu1Yw4uaro1R3ibs27ztw@mail.gmail.com>
	<27816.1613085646@warthog.procyon.org.uk>
In-Reply-To: <27816.1613085646@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Feb 2021 17:05:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi68OpbwBm6RCodhNUyg6x8N7vi5ufjRtosQSPy_EYqLA@mail.gmail.com>
Message-ID: <CAHk-=wi68OpbwBm6RCodhNUyg6x8N7vi5ufjRtosQSPy_EYqLA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache: I/O API modernisation and
	netfs helper library
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

On Thu, Feb 11, 2021 at 3:21 PM David Howells <dhowells@redhat.com> wrote:
>
> Most of the development discussion took place on IRC and waving snippets of
> code about in pastebin rather than email - the latency of email is just too
> high.  There's not a great deal I can do about that now as I haven't kept IRC
> logs.  I can do that in future if you want.

No, I really don't.

IRC is fine for discussing ideas about how to solve things.

But no, it's not a replacement for actual code review after the fact.

If you think email has too long latency for review, and can't use
public mailing lists and cc the people who are maintainers, then I
simply don't want your patches.

You need to fix your development model. This whole "I need to get
feedback from whoever still uses irc and is active RIGHT NOW" is not a
valid model. It's fine for brainstorming for possible approaches, and
getting ideas, sure.

               Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

