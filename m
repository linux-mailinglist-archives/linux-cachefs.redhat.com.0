Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680E489813
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Jan 2022 12:52:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-XtOd4YqUMduMWSJ_3HjwQA-1; Mon, 10 Jan 2022 06:52:40 -0500
X-MC-Unique: XtOd4YqUMduMWSJ_3HjwQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A609880292C;
	Mon, 10 Jan 2022 11:52:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D3A7D533;
	Mon, 10 Jan 2022 11:52:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 099611809CB8;
	Mon, 10 Jan 2022 11:52:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20ABqXPN031881 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 06:52:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B0C146D1E6; Mon, 10 Jan 2022 11:52:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76D0846D1E0
	for <linux-cachefs@redhat.com>; Mon, 10 Jan 2022 11:52:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9491C04B41
	for <linux-cachefs@redhat.com>; Mon, 10 Jan 2022 11:52:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-586-fngIB6O0Nk6RDO_mzTOtiA-1; Mon, 10 Jan 2022 06:52:31 -0500
X-MC-Unique: fngIB6O0Nk6RDO_mzTOtiA-1
Received: by mail-ed1-f50.google.com with SMTP id c71so40917070edf.6
	for <linux-cachefs@redhat.com>; Mon, 10 Jan 2022 03:52:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oZjgw8dNYz+IuIPHh62asjXeqka/jIRSHm/Gv196S1g=;
	b=YOYxcNW4tnQCv5PfUDJ40CHU2XJV+OhnDqCsfhGNEJBqRXjGhxNixkNXfeJcbjdrBk
	3ggbdNvXQGxPDggzolzUX15Z9Tf+i7bR512/BUBe0meCU1H4CcN4ph9lkNsgOCB/LuSp
	h2jPccWM4oDHr/6z7wXJwMl7xffp4snU0CMTFg8Oq6rDoWGYXjwT8DhCrNKzCSEqiHa3
	HQUrTwbBOIEvKy56faX4qnE84H4maEbx+ikazAKbyrgeiwVenzw3IP1N1yxugCPFnVOe
	w7B6DxYGAex+sZJBAXyB/NOIsHlWekCmxFwOwHMdeem9faq8IzKcAIKn5LtuD9DEgDU1
	CM6w==
X-Gm-Message-State: AOAM530wd1+5xr7OwKp0cn8oDxUuaGOP3cGt+/VHEQRg7f0XUZLzCyln
	+EWAgVpbw04Sjt/TnT2Uelhu0hPWb864d70w/cjpu4/BEFxyP/1Z
X-Google-Smtp-Source: ABdhPJwZ9oxJoUEpzejwoVPTMjuryy43ggbQjrZPgP0wqIocQqkRl8Zoc2HuZnLb8F8WHDRduantAe4kZfDfeiBwjAs=
X-Received: by 2002:a50:d710:: with SMTP id t16mr74631953edi.50.1641815550234; 
	Mon, 10 Jan 2022 03:52:30 -0800 (PST)
MIME-Version: 1.0
References: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
In-Reply-To: <164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
From: Daire Byrne <daire@dneg.com>
Date: Mon, 10 Jan 2022 11:51:54 +0000
Message-ID: <CAPt2mGNt0shT7xmvCKb-G+gpza_eTrVqPhcVGx_7+smtGOHECw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-cachefs@redhat.com, Anna Schumaker <Anna.Schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v4 00/68] fscache, cachefiles: Rewrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 22 Dec 2021 at 23:13, David Howells <dhowells@redhat.com> wrote:
> These patches can be found also on:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-rewrite

I have run this through our production workloads without issue. There
were no recorded performance or stability differences between this and
the old fscache/cachefiles.

Our workload comprises mounting ~20 remote servers with "-o fsc" over
the WAN and then re-exporting those to 500 local client instances.
This production workload churns the fscache backing filesystem (EXT4)
pretty well (hundreds of MB/s) across all of the mount points
simultaneously.

I tested with both NFSv4.2 and NFSv3 mounts. Previously written cache
data was correctly reused between reboots and remounts.

Tested-by: Daire Byrne <daire@dneg.com>

Cheers,

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

