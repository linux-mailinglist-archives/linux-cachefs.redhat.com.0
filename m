Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E03546FE9
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Jun 2022 01:20:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-PNfEIq6uO-aSeceqPybq2Q-1; Fri, 10 Jun 2022 19:20:08 -0400
X-MC-Unique: PNfEIq6uO-aSeceqPybq2Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88EC71C04B72;
	Fri, 10 Jun 2022 23:20:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D44FB492C3B;
	Fri, 10 Jun 2022 23:20:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 52EFB194705B;
	Fri, 10 Jun 2022 23:20:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7B8F71947054 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 23:20:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6CB2BC27E97; Fri, 10 Jun 2022 23:20:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68EEAC2811A
 for <linux-cachefs@redhat.com>; Fri, 10 Jun 2022 23:20:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51FCD80159B
 for <linux-cachefs@redhat.com>; Fri, 10 Jun 2022 23:20:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-G4f1wTZgMRmE2ngdhrdwjg-1; Fri, 10 Jun 2022 19:19:58 -0400
X-MC-Unique: G4f1wTZgMRmE2ngdhrdwjg-1
Received: by mail-ej1-f45.google.com with SMTP id n10so751743ejk.5
 for <linux-cachefs@redhat.com>; Fri, 10 Jun 2022 16:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mFUZ/4X/JukFzJtRWCj5IwVqnR0commkjm8Ld9IJoQA=;
 b=0HDM6rgJP9SzwuRdgVKUy27zRv2M4xnHcbkGodNNAo5L2svndY9lJ0Xpy4cRlsN00I
 YmOqg9bNyPRgwff762e3+L5970DJSjFkimxxV2CeApyi4uISmFR7DrRHuudt3IlByfvm
 1fEM7Kmm+SSXTqVm7g8TGz4rbJjvJvtgLUApBl+1fno5CSv3JWcF97O9iPVhwWTsRijG
 eisi2DUmwIHWDv9U7HMh1d9JlCoAj7KsGUFFw97xDE6ZryXnd1a4OV83GH40vMPEGQaY
 vjNM7I4BNxlyhclgq6OcLKS4wMmRb4t3FGXnnVP2b/b+25ivzayk3U8AJtkEziD5hSHm
 6ISg==
X-Gm-Message-State: AOAM530EjZDl9WhGmbxeJ5pblr9VEwAsavYZFIimZ4v8V5Tiy8Fy0+1t
 gQwo49zbkeojE0hi1z43rWpbPbVndap72W3q
X-Google-Smtp-Source: ABdhPJxvYZ8Pgbdds9ZfJLVf57fnw/+NhKXVAxBEuxo2fgdK6E3fwOBNoij/cP+lC7DB3q5u+AzNpg==
X-Received: by 2002:a17:906:7304:b0:6ff:a76:5b09 with SMTP id
 di4-20020a170906730400b006ff0a765b09mr43734973ejc.193.1654903196427; 
 Fri, 10 Jun 2022 16:19:56 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 sd22-20020a170906ce3600b006fea59ef3a5sm215864ejb.32.2022.06.10.16.19.55
 for <linux-cachefs@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 16:19:55 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id e5so216957wma.0
 for <linux-cachefs@redhat.com>; Fri, 10 Jun 2022 16:19:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3485:b0:39c:7db5:f0f7 with SMTP id
 a5-20020a05600c348500b0039c7db5f0f7mr2015707wmq.8.1654903194928; Fri, 10 Jun
 2022 16:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <165489100590.703883.11054313979289027590.stgit@warthog.procyon.org.uk>
In-Reply-To: <165489100590.703883.11054313979289027590.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 10 Jun 2022 16:19:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgeW2nF5MZzmx6cPmS8mbq0kjP+VF5V76LNDLDjJ64hUA@mail.gmail.com>
Message-ID: <CAHk-=wgeW2nF5MZzmx6cPmS8mbq0kjP+VF5V76LNDLDjJ64hUA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [RFC][PATCH 0/3] netfs, afs: Cleanups
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
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
 AND..." <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 10, 2022 at 12:56 PM David Howells <dhowells@redhat.com> wrote:
>
> Here are some cleanups, one for afs and a couple for netfs:

Pulled,

               Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

