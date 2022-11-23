Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3A636D9F
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 23:53:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669244005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fBjJ36lQ27bLQZKZbfIwDX6IPLc1EpLSyy4wU9CBt0s=;
	b=g8QGMZAxLxPuogLpTuQTd0h8qofG2MPTBPRZjzi1JYldOV25hH4wMQURNYSJHqTMLkv2Lv
	zFAv6ibbdG/75/7d9shP6XcVmscRvp9zEBFJcb2dX0VU5CjMcG7vZU70uShi3oFvRewqz2
	TAemlcOsxWDsVcoaBy9qc4WvmCtEq/A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-F8Ans50mNROvmJEvZ0rarA-1; Wed, 23 Nov 2022 17:53:22 -0500
X-MC-Unique: F8Ans50mNROvmJEvZ0rarA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F41F3185A794;
	Wed, 23 Nov 2022 22:53:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA613492B07;
	Wed, 23 Nov 2022 22:53:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C69D4194658D;
	Wed, 23 Nov 2022 22:53:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9ACB1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 22:53:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6B166111E41C; Wed, 23 Nov 2022 22:53:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 637C2111E414
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 22:53:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EBD48339B4
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 22:53:19 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-D9S1cZ_GMFqa2hB7yyCMCg-1; Wed, 23 Nov 2022 17:53:17 -0500
X-MC-Unique: D9S1cZ_GMFqa2hB7yyCMCg-1
Received: by mail-qv1-f44.google.com with SMTP id e15so13134191qvo.4
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 14:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kZnCvaEQ344vGtn47RMsQAQkT919w64rZm3gu+vPQMY=;
 b=3NSaCSE6CoxSEYda+pv6F6KM23xlYIk5DaXF4JZQRlGJLAYZnPPbMcJmedG/Kl4j7Z
 3D6GpvAg5d4p5/io7v1j/rpBd8MF/jpRTMimiSaWhdN4j9XOY/biwKrZObqDFjkY+YAn
 c5yrlo3oMuNX99ZH4MA9lsSt10RQOxQZf2hl+EIJazNJRipGC0O+xcfG//byNZNxXACx
 Bxqz4h6ZC3KLgBqHXe96B6r1vk9jqNrPXxEmleivs29SIxygFO4lG+f4y8SA54fpYvvw
 DstnBoA17/eHBLFdaekP09QTGEDXJb/kRSD4/W73p8QrCaowhLqrce2ue2PyLOpMBr6R
 WOvw==
X-Gm-Message-State: ANoB5plEn0lNXopypBCFieFL0TEzQyvTtYaTR+v7hdzafuBVlCPfeuwl
 J1apdpwkMlvDPhrAAWfQZZIgX9ulgQwgag==
X-Google-Smtp-Source: AA0mqf7JzJ3ROglCidSSIiRyPV/jVZE1eG5R5XB0twnXVcH/La2TUVM+6heuVf9AD5FiuUQHMMCM9A==
X-Received: by 2002:a0c:fb47:0:b0:4c6:b60c:6268 with SMTP id
 b7-20020a0cfb47000000b004c6b60c6268mr10785656qvq.38.1669243996110; 
 Wed, 23 Nov 2022 14:53:16 -0800 (PST)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 fb13-20020a05622a480d00b003999d25e772sm10636451qtb.71.2022.11.23.14.53.14
 for <linux-cachefs@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 14:53:14 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id cg5so135053qtb.12
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 14:53:14 -0800 (PST)
X-Received: by 2002:ac8:44b9:0:b0:3a5:81ec:c4bf with SMTP id
 a25-20020ac844b9000000b003a581ecc4bfmr16610980qto.180.1669243994092; Wed, 23
 Nov 2022 14:53:14 -0800 (PST)
MIME-Version: 1.0
References: <166924370539.1772793.13730698360771821317.stgit@warthog.procyon.org.uk>
In-Reply-To: <166924370539.1772793.13730698360771821317.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Nov 2022 14:52:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjq7gRdVUrwpQvEN1+um+hTkW8dZZATtfFS-fp9nNssRw@mail.gmail.com>
Message-ID: <CAHk-=wjq7gRdVUrwpQvEN1+um+hTkW8dZZATtfFS-fp9nNssRw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v4 0/3] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-erofs@lists.ozlabs.org, Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 23, 2022 at 2:48 PM David Howells <dhowells@redhat.com> wrote:
>
>   I've also got rid of the bit clearances
> from the network filesystem evict_inode functions as they doesn't seem to
> be necessary.

Well, the patches look superficially cleaner to me, at least. That
"doesn't seem to be necessary" makes me a bit worried, and I'd have
liked to see a more clear-cut "clearing it isn't necessary because X",
but I _assume_ it's not necessary simply because the 'struct
address_space" is released and never re-used.

But making the lifetime of that bit explicit might just be a good idea.

             Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

