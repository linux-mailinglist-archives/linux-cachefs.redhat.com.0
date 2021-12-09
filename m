Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F4246F200
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 18:33:25 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-a9t2hANMMXWoyb3fIxvKbQ-1; Thu, 09 Dec 2021 12:33:21 -0500
X-MC-Unique: a9t2hANMMXWoyb3fIxvKbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2221C1023F4E;
	Thu,  9 Dec 2021 17:33:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F074A100164A;
	Thu,  9 Dec 2021 17:33:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E20254CA93;
	Thu,  9 Dec 2021 17:33:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9HWPbq023196 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 12:32:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5D77453A8; Thu,  9 Dec 2021 17:32:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5661453B2
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 17:32:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5F362B478C8
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 17:32:20 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-105-Yf3WAeo6P02h977z2ZjgmA-1; Thu, 09 Dec 2021 12:32:19 -0500
X-MC-Unique: Yf3WAeo6P02h977z2ZjgmA-1
Received: by mail-ed1-f45.google.com with SMTP id r25so21406525edq.7
	for <linux-cachefs@redhat.com>; Thu, 09 Dec 2021 09:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iqExJZ9/DphBTKULUzi0rda5Ww/lFJEMJ0HrtECPjTI=;
	b=UZuDGmIsHSTuxbIsCOhGVo+GDmudzSCfHV1Ln7HWuedcB9U7mp7A+M99ny0kz+nkBv
	dVk0vUt1llApjZuo3n+v5qLhEZ7JHCypdkV6Ydpg6M1JFEsFcY8S8IVmlR0OgrOzrfXh
	Umm5lEutXTssXqSTzekbolkRAYmq0jNObITEkppL021fGfy8+r5yKnjbkehYF3d1GlOb
	V9yzgtPoLf1dIRcCv8GkY4rZTqn1i/ezihkbWl4lOX0AbVugwQ1ORintxRH4eckvd8Ad
	eEersQFnBWRttYFmK1vS6QRWITv+fBFHQSFfawWcyDmmWFgnFwS1tkR86/HiHBvrMjQt
	gUOA==
X-Gm-Message-State: AOAM533ps6Wahdw0CvyW1epgZkY1umSEio1ht67ZdsZvNQOZ7Nv51q+2
	inc4rD5c+gcRcMRa3krv8X309qOWjQN5B/Px
X-Google-Smtp-Source: ABdhPJwW5T3X2D0uzuXSMXanKr6Rw3BnTR9hr97pbGZ/TQK2YTG+LDW3sit714GG6EACVR3coaYxDw==
X-Received: by 2002:a17:907:60c9:: with SMTP id
	hv9mr16814512ejc.482.1639070949366; 
	Thu, 09 Dec 2021 09:29:09 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
	[209.85.128.48])
	by smtp.gmail.com with ESMTPSA id i5sm202790ejw.121.2021.12.09.09.29.09
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Dec 2021 09:29:09 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
	r9-20020a7bc089000000b00332f4abf43fso5694649wmh.0
	for <linux-cachefs@redhat.com>; Thu, 09 Dec 2021 09:29:09 -0800 (PST)
X-Received: by 2002:a05:600c:22ce:: with SMTP id
	14mr8659906wmg.152.1639070533785; 
	Thu, 09 Dec 2021 09:22:13 -0800 (PST)
MIME-Version: 1.0
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<163906891983.143852.6219772337558577395.stgit@warthog.procyon.org.uk>
In-Reply-To: <163906891983.143852.6219772337558577395.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Dec 2021 09:21:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgejk2DA53dkzs6NquDbQk5_r6Hw8_-RJQ0_njNijKYew@mail.gmail.com>
Message-ID: <CAHk-=wgejk2DA53dkzs6NquDbQk5_r6Hw8_-RJQ0_njNijKYew@mail.gmail.com>
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
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 10/67] fscache: Implement cookie
	registration
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

On Thu, Dec 9, 2021 at 8:55 AM David Howells <dhowells@redhat.com> wrote:
>
> +               buf = (u32 *)cookie->inline_key;
> +       }
> +
> +       memcpy(buf, index_key, index_key_len);
> +       cookie->key_hash = fscache_hash(cookie->volume->key_hash, buf, bufs);

This is actively wrong given the noise about "endianness independence"
of the fscache_hash() function.

There is absolutely nothing endianness-independent in the above.
You're taking some random data, casting the pointer to a native
word-order 32-bit entity, and then doing things in that native word
order.

The same data will give different results on different endiannesses.

Maybe some other code has always munged stuff so that it's in some
"native word format", but if so, the type system should have been made
to match. And it's not. It explicitly casts what is clearly some other
pointer type to "u32 *".

There is no way in hell this is properly endianness-independent with
each word in an array having some actual endianness-independent value
when you write code like this.

I'd suggest making endianness either explicit (make things explicitly
"__le32" or whatever) and making sure that you don't just randomly
cast pointers, you actually have the proper types.

Or, alternatively, just say "nobody cares about BE any more,
endianness isn't relevant, get over it".

But don't have functions that claim to be endianness-independent and
then randomly access data like this.

              Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

