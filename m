Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A09C340B4AE
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Sep 2021 18:31:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-H4tmOUvlOuKF7H_xNOiyqg-1; Tue, 14 Sep 2021 12:31:47 -0400
X-MC-Unique: H4tmOUvlOuKF7H_xNOiyqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53FDF1006AA2;
	Tue, 14 Sep 2021 16:31:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9961E1346F;
	Tue, 14 Sep 2021 16:31:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75A231803B30;
	Tue, 14 Sep 2021 16:31:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18EGVfjU032707 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 14 Sep 2021 12:31:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B188A202B183; Tue, 14 Sep 2021 16:31:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE1D201AC62
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 16:31:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 051508934E6
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 16:31:39 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-YyJIJbLcOCmV5Wb1r_5RqA-1; Tue, 14 Sep 2021 12:31:37 -0400
X-MC-Unique: YyJIJbLcOCmV5Wb1r_5RqA-1
Received: by mail-ed1-f52.google.com with SMTP id j13so20836519edv.13
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 09:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uU34i+EgJe3tqn17AWoGwVGTTIh0KVlY0SraTTmp6T0=;
	b=pYXJ3pLvCED9ffus5il4dgM8tSlvMgY5SVqIxj9tgAIEYXOvuGnnKN78B4GTj4w57x
	qcmZAIMDiV7ktzwP4qG9wnQGjmfBoQAMvE2z43tYCGGdUIp17Y2PMvMAz+yCzfo5S75r
	mAGb92LfP0jT9x1MzFpqqz7EKr6zO9QpcQNYu2/o3kmX43UwCflaSNAYnQN34JErGhvF
	aLT+0m1ROk3CjFTWpOdgelvnDJ7nr/pMYSQEMkEDE8zPp0B+a1tpq6oJ3c09Tjx6Ijmg
	hE7LSuk8ElZsvvIkpKYnax+Q5UBvDULHqop5coXS+oFESCAzA8YxK37lja0gPQdmEjhA
	UJxg==
X-Gm-Message-State: AOAM533MxpoeFHgRWPabh5poR6gQRIBQ9Mggpw0dSclSEzkuz1JTF66Z
	Odz6wOstP8Mxo2RJbo/po9q4hVHubOhM7qdgjkE=
X-Google-Smtp-Source: ABdhPJzd4sD3jaRuI3AQZ9whW84NNZbUDGqIb6O8sDH+hrryqOxkl7ngx00PVmyy7Ms0zbiTeUl+Xg==
X-Received: by 2002:a50:d5c1:: with SMTP id g1mr5440867edj.296.1631637096048; 
	Tue, 14 Sep 2021 09:31:36 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	s18sm5317699ejh.12.2021.09.14.09.31.35 for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 14 Sep 2021 09:31:35 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id i21so30305489ejd.2
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 09:31:35 -0700 (PDT)
X-Received: by 2002:a2e:b53a:: with SMTP id z26mr15485756ljm.95.1631636661566; 
	Tue, 14 Sep 2021 09:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
	<CAHk-=wiVK+1CyEjW8u71zVPK8msea=qPpznX35gnX+s8sXnJTg@mail.gmail.com>
In-Reply-To: <CAHk-=wiVK+1CyEjW8u71zVPK8msea=qPpznX35gnX+s8sXnJTg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 09:24:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgR_unCDRZ+8iTb5gBO6bgRkuS4JYBpi25v12Yp6TzWVA@mail.gmail.com>
Message-ID: <CAHk-=wgR_unCDRZ+8iTb5gBO6bgRkuS4JYBpi25v12Yp6TzWVA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [RFC PATCH 0/8] fscache: Replace and remove old
	I/O API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 14, 2021 at 9:21 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Call it "fallback" or "simple" or something that shows the intent, but
> no, I'm not taking patches that introduce a _new_ interface and call
> it "deprecated".

Put another way: to call something "deprecated", you have to already
have the replacement all ready to go.

And if you have that, then converting existing code to a deprecated
model isn't the way to go.

So in neither situation does it make any sense to convert anything to
a model that is deprecated.

          Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

