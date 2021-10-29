Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D334400AE
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Oct 2021 18:55:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-oMv5d04dMQKiLqGGu4tLIA-1; Fri, 29 Oct 2021 12:54:56 -0400
X-MC-Unique: oMv5d04dMQKiLqGGu4tLIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59442806689;
	Fri, 29 Oct 2021 16:54:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB18D26E4C;
	Fri, 29 Oct 2021 16:54:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F65A1806D03;
	Fri, 29 Oct 2021 16:54:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TGnvSH028990 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 12:49:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A2B140C1242; Fri, 29 Oct 2021 16:49:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4606F400F3EC
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 16:49:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BD49866DF4
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 16:49:57 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-95-KYTV0hZQPCuVYGpatRMM9w-1; Fri, 29 Oct 2021 12:49:55 -0400
X-MC-Unique: KYTV0hZQPCuVYGpatRMM9w-1
Received: by mail-lj1-f173.google.com with SMTP id u5so17829855ljo.8
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 09:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aEdVDAPX40INreqiADCLispl36CO/b9z9SQKpRdVE1Y=;
	b=QhDLMM6Dl2KTUXV9aKS+3izOda7aiTzsVclZjeVpj4F2qkl+08PJsFDbh+JHeOcQN3
	6aJT/p9LbMVCjs/s0RLWoyysfoyNX0U5FdQe0E3Pil5RLmZLIcYPqIcS6XmX3PsqNbG3
	DRVwo6NyMJFhSrz0AKE2F9JjZq+lZcOaEYDUcIlPi0fYKkJU+RHQ0RtBObfvSYagKDaV
	DsscF8NEABOFtTE7P68pMuVNwNqhBzW5pF0kRNWL3YcFJzbQ5kVPusyeXHvQBlRsIE68
	5a3khmHc3xo7I55fqJkxtsTJYbDEbvmBDN+d6pf51mhrUNm+jA5wlFLKSBdXVv3bi6hB
	XEVg==
X-Gm-Message-State: AOAM532L7jSQ4S7wCBxsQhLITxgW54v/zQxNLuYOjFd8hXe0VHQ0UtnS
	ZRKzlcIA6DeeuBA738az3BO8gwifwCi7Z2Po
X-Google-Smtp-Source: ABdhPJw8u+sQPrQD/rfFhT3qiGtf++jJir1khz0+n6Qx2M9QP01ATylZI4an5W4ko+pIa8I3cmmHjA==
X-Received: by 2002:a05:651c:1613:: with SMTP id
	f19mr12804273ljq.92.1635526193018; 
	Fri, 29 Oct 2021 09:49:53 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
	[209.85.208.177])
	by smtp.gmail.com with ESMTPSA id v2sm136625lfp.303.2021.10.29.09.49.51
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 29 Oct 2021 09:49:51 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id u5so17829650ljo.8
	for <linux-cachefs@redhat.com>; Fri, 29 Oct 2021 09:49:51 -0700 (PDT)
X-Received: by 2002:a2e:b744:: with SMTP id k4mr12794150ljo.31.1635526190871; 
	Fri, 29 Oct 2021 09:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk>
In-Reply-To: <163551653404.1877519.12363794970541005441.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Oct 2021 09:49:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiy4KNREEqvd10Ku8VVSY1Lb=fxTA1TzGmqnLaHM3gdTg@mail.gmail.com>
Message-ID: <CAHk-=wiy4KNREEqvd10Ku8VVSY1Lb=fxTA1TzGmqnLaHM3gdTg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, linux-afs@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 00/10] fscache: Replace and remove
	old I/O API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 29, 2021 at 7:09 AM David Howells <dhowells@redhat.com> wrote:
>
>  (1) A simple fallback API is added that can read or write a single page
>      synchronously.  The functions for this have "fallback" in their names
>      as they have to be removed at some point.

David, I still don't understand WHY.

I read the explanations in the commits, and that didn't help either.

Why, of why, do you insist of adding this intermediate interface that
is already documented to "must be removed" at the point it is even
added?

What's the point of adding garbage that is useless in the long run?

Why is the first step not just "remove fscache"?

Why is there this addition of the "deprecated" interface - that you
have now renamed "fallback"?

I agree that "fallback" is a less annoying name, so that renaming is
an improvement, but WHY?

I absolutely detested your whole "move old garbage around before
removal", and I also detest this "add new garbage that will be
removed".

What's the point? Why isn't the fix just "remove CONFIG_FSCACHE and
all the code".

You already *HAVE* the "fallback" code - it's all that

    #else /* CONFIG_NFS_FSCACHE */
    static inline int nfs_fscache_register(void) { return 0; }
    static inline void nfs_fscache_unregister(void) {}
    ...

stuff in <nfs/fscache.h> and friends. So why do you need _new_
fallback code, when CONFIG_FSCACHE already exists and already has a
"this disables fscache"?

Maybe there is some really good reason, but that really good reason
sure as hell isn't documented anywhere, and I really don't see the
point.

So let me say this again:

 - it would be much better if you could incrementally just improve the
existing FSCACHE so that it just _works_ all the time, and fixes the
problems in it, and a bisection works, and there is no flag-day.

 - but dammit, if you have to have a flag-day, then there is NO POINT
in all this "move the old code around before moving it", or "add a
fallback interface before removing it again".

Oh, I can understand wanting to keep the header files around in case
the interfaces end up being similar enough in the end that it all
matters.

But I don't understand why you do this kind of crud:

 fs/cachefiles/io.c      |   28 ++++++++-
 fs/fscache/io.c         |  137 +++++++++++++++++++++++++++++++++++++++------

when the neither of those directories will ever even be *compiled* if
CONFIG_FSCACHE isn't true (because CACHEFILES has a "depends on
FSCACHE").

See my argument? If FSCACHE isn't usable during the transition, then
don't make these kinds of pointless code movement or creation things
that are just dead.

There's absolutely no point in having some "fallback" interface that
allows people to test some configuration that simply isn't relevant.
It doesn't help anything. It just adds more noise and more
configurations, and no actual value that I can see.

It doesn't help bisectability: if some bug ever bisects to the
fallback code, what does that tell us? Nothing. Sure, it trivially
tells us the fallback code was buggy, but since the fallback code has
been removed afterwards, the _value_ of that information is nil,
zilch, nada. It's not "information", it's just "worthless data".

And hey, maybe there's some issue that I don't understand, and I don't
see. But if there is some subtle value here, it should  have been
documented.

So I say exactly the same thing I said last time: if the old fscache
code is not usable, and you can't incrementally fix it so that it
works all the time, then JUST REMOVE IT ALL. Moving it elsewhere
before the removal is only pointless noise. But adding some fallback
intermediate code before removal is ALSO just pointless noise.

Doing a flag-day with "switch from A to B" is already painful and
wrong. I don't like it. But I like it even _less_, if it's a "switch
from A to B to C".

If you do want t9o have a "halfway state", the only halfway state that
makes sense to me is something like

 (a) make all the changes to the old FSCACHE - keeping it all
_working_ during this phase - to make it have the same _interfaces_ as
the new fscache will have.

 (b) then remove the old FSCACHE entirely

 (c) then plop in the new FSCACHE

But note how there was no "fallback" stage anywhere. No code that lies
around dead at any point. At each point it was either all working old
or all working new (or nothing at all).

Yes, in this case that "step (a)" is extra work and you're basically
modifying code that you know will be removed, but the advantage now is

 -  at least the fscache _users_ are being modified while the old and
tested world is still working, and the interface change is
"bisectable" in that sense. That's useful in itself.

 - if it turns out that people have problems with the new generation
FSCACHE, they can reverse steps (b) and (c) without having to touch
and revert all the other filesystems changes.

IOW, if a "same interfaces" state exists, that's fine. But for it to
make sense, those same interfaces have to be actually _useful_, not
some fallback code that is neither the old nor the new.

And maybe you can't do that "step (a)" because the interfaces are part
of the fundamental problem with the old FSCACHE. But if you drop (a),
then don't add some stage between (b) and (c), because it's not
helpful.

And again, maybe I'm missing something. But really, I don't see why
this "remove old FSCACHE" stage should *ever* make any modifications
to fs/fscache/* and fs/cachefiles/* when disabling the config option
means that it just won't get built at all.

               Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

