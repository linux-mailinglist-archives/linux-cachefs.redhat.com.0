Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 487DF40B492
	for <lists+linux-cachefs@lfdr.de>; Tue, 14 Sep 2021 18:26:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-ialqAzmZOzm7VGbfoGX7HQ-1; Tue, 14 Sep 2021 12:26:57 -0400
X-MC-Unique: ialqAzmZOzm7VGbfoGX7HQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55131100F942;
	Tue, 14 Sep 2021 16:26:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 968C86C8F9;
	Tue, 14 Sep 2021 16:26:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A38AC1803B30;
	Tue, 14 Sep 2021 16:26:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18EGMNN3032050 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 14 Sep 2021 12:22:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2004201B070; Tue, 14 Sep 2021 16:22:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDE65201E75D
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 16:22:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4100800B26
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 16:22:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-V8wKzBRWOXyfvZcoC0vWVA-1; Tue, 14 Sep 2021 12:22:19 -0400
X-MC-Unique: V8wKzBRWOXyfvZcoC0vWVA-1
Received: by mail-lf1-f51.google.com with SMTP id i4so12906485lfv.4
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 09:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3dYD2uKNORcxZ6YMCdwcOxjjHXEclNcfa/CTjAP47gc=;
	b=45iSi6fEicEa/vVjwYfWTJ4cWt0Ey4QL91r/MbFfgoUz4fyaefkGKa3nCxmU/TilPl
	bAtxsxbr7N2kKYIL9WnkZ74GhjzYO4AQGil9I3AtoYt9o534WR3hNQnUAYKUMk9bGL1k
	62kcKcKCBiHkJZTg0JP87jQ2uWNvRCZq/ljVbViJNZ27asFfGMauTiAXliKNjPvV2wo9
	dtevX54Ej0UgO4+8npaLBAlExweDOemyKhuwy606ZscKS6cW+OxOxgv64KGmNqq45FWO
	kiRz/l4jiE8RZ5BW/GkO9AkCbSEc5KkR7GzNPyv/H4DLbwqbtvKqaYqmQ3oPfGfEI465
	zwcA==
X-Gm-Message-State: AOAM531UfZmwJAi2lSWEXLbdTAGhNORBH5tQRkoojnytn3nScEmQhH59
	MwDdHney6k5PfFaeWb6HJIum8alkTQpCOFOgY8E=
X-Google-Smtp-Source: ABdhPJxdmMPxf0gtgawnGFDisYo1lMbF3Vtf8PwmR6HeJflGiO3Ji476f1SFnwKs2J2kP7AS6I6X3w==
X-Received: by 2002:a05:6512:11f1:: with SMTP id
	p17mr13805724lfs.203.1631636537029; 
	Tue, 14 Sep 2021 09:22:17 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
	[209.85.167.46])
	by smtp.gmail.com with ESMTPSA id t4sm625910lfp.250.2021.09.14.09.22.14
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 14 Sep 2021 09:22:14 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id a4so30043621lfg.8
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 09:22:14 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id
	k37mr14013881lfv.655.1631636533920; 
	Tue, 14 Sep 2021 09:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
In-Reply-To: <163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 09:21:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVK+1CyEjW8u71zVPK8msea=qPpznX35gnX+s8sXnJTg@mail.gmail.com>
Message-ID: <CAHk-=wiVK+1CyEjW8u71zVPK8msea=qPpznX35gnX+s8sXnJTg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Sep 14, 2021 at 6:54 AM David Howells <dhowells@redhat.com> wrote:
>
>  (1) A simple fallback API is added that can read or write a single page
>      synchronously.  The functions for this have "deprecated" in their names
>      as they have to be removed at some point.

I'm looking at those patches, and there's no way I'll apply anything
that starts out with moving to a "deprecated" interface.

Call it "fallback" or "simple" or something that shows the intent, but
no, I'm not taking patches that introduce a _new_ interface and call
it "deprecated".

            Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

