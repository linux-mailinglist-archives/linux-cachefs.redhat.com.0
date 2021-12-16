Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D1477CDB
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 20:53:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-718r-HILOc-BPb923equSw-1; Thu, 16 Dec 2021 14:53:41 -0500
X-MC-Unique: 718r-HILOc-BPb923equSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A1DA760C7;
	Thu, 16 Dec 2021 19:53:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 966484BC73;
	Thu, 16 Dec 2021 19:53:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F16574BB7C;
	Thu, 16 Dec 2021 19:53:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGJkj2K025949 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 14:46:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6BC5E1120AC1; Thu, 16 Dec 2021 19:46:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66B7C1120ABE
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 19:46:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A5E1811E76
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 19:46:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-18-9uriWoi4PwCSEQ7zeJDCzw-1; Thu, 16 Dec 2021 14:46:39 -0500
X-MC-Unique: 9uriWoi4PwCSEQ7zeJDCzw-1
Received: by mail-ed1-f53.google.com with SMTP id z5so91573860edd.3
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 11:46:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1YEg3xCizKQigIIVaj+7NPGS0vV5YzouOWDo8EKHI8Y=;
	b=G4rUZhcQZQ20ddXArsWmijxkReWKC2ImKtsgYNBkrq6z/HRYhl1wkpRMIs1ue9sGgl
	CGurhNIu168dR6zoyetORKPhh5YqA93bjmF1oKiSccYPZ+yKWsv2KMxBqy44g5v8pKjA
	dyBE4hKi6yAKNGDJay1Z6xQ3aPmf/g5fMJ4cX74AO6BXr1d3GxID+4wPlxeIrRE7g4cB
	J1fgT4uFplLbl9da+bD/gQWGsdd93s+h4agTIgBTw1D/ld/ZFAfpWXsn6yWjZcclSFnt
	UcAhlgxR+FW3MjghlJ85SiEAI8+U9OmmlF/YT7iKtmFSdQOb/Pc74wHAuYx6ZarwwrH6
	XYdg==
X-Gm-Message-State: AOAM530/s2STZXvHtgiRLMvT3n+2rEa/OQcmfgP2+qBb+4GLpYWiDqq7
	dNBKIurwKjkI5CFEO0aELIl+FrfMNL42ekIYKks=
X-Google-Smtp-Source: ABdhPJxBmeDJaRIlxAKu6PX7b+kl3ruyVouAj9AgbOoHrNM4CQ03aW9Pvqjw+4HHgR5z9Q4voQKwuw==
X-Received: by 2002:a17:906:a215:: with SMTP id
	r21mr16638453ejy.21.1639683997283; 
	Thu, 16 Dec 2021 11:46:37 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
	[209.85.221.52]) by smtp.gmail.com with ESMTPSA id
	he14sm1999942ejc.55.2021.12.16.11.46.34
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 16 Dec 2021 11:46:35 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id j9so98642wrc.0
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 11:46:34 -0800 (PST)
X-Received: by 2002:a5d:4575:: with SMTP id a21mr10519052wrc.193.1639683994422;
	Thu, 16 Dec 2021 11:46:34 -0800 (PST)
MIME-Version: 1.0
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
	<163967169723.1823006.2868573008412053995.stgit@warthog.procyon.org.uk>
	<CAHk-=wi0H5vmka1_iWe0+Yc6bwtgWn_bEEHCMYsPHYtNJKZHCQ@mail.gmail.com>
	<YbuTaRbNUAJx5xOA@casper.infradead.org>
In-Reply-To: <YbuTaRbNUAJx5xOA@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 Dec 2021 11:46:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh2dr=NgVSVj0sw-gSuzhxhLRV5FymfPS146zGgF4kBjA@mail.gmail.com>
Message-ID: <CAHk-=wh2dr=NgVSVj0sw-gSuzhxhLRV5FymfPS146zGgF4kBjA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	linux-afs@lists.infradead.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH v3 56/68] afs: Handle len being
	extending over page end in write_begin/write_end
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 16, 2021 at 11:28 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> Since ->write_begin is the place where we actually create folios, it
> needs to know what size folio to create.  Unless you'd rather we do
> something to actually create the folio before calling ->write_begin?

I don't think we can create a folio before that, because the
filesystem may not even want a folio (think persistent memory or
whatever).

Honestly, I think you need to describe more what you actually want to
happen. Because generic_perform_write() has already decided to use a
PAGE_SIZE by the time write_begin() is called,

Right now the world order is "we chunk things by PAGE_SIZE", and
that's just how it is.

I can see other options - like the filesystem passing in the chunk
size when it calls generic_perform_write().

Or we make the rule be that ->write_begin() simply always is given the
whole area, and the filesystem can decide how it wants to chunk things
up, and return the size of the write chunk in the status (rather than
the current "success or error").

But at no point will this *EVER* be a "afs will limit the size to the
folio size" issue. Nothing like that will ever make sense. Allowing
bigger chunks will not be about any fscache issues, it will be about
every single filesystem that uses generic_perform_write().

So I will NAK these patches by David, because they are fundamentally
wrong, whichever way we turn. Any "write in bigger chunks" patch will
be something else entirely.

                 Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

