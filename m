Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E671C46ED00
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 17:24:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-521-tcs6yeXnO2-DQ9AjD_z85g-1; Thu, 09 Dec 2021 11:24:11 -0500
X-MC-Unique: tcs6yeXnO2-DQ9AjD_z85g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67B841006AA4;
	Thu,  9 Dec 2021 16:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A7D694C0;
	Thu,  9 Dec 2021 16:24:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A12451809CB9;
	Thu,  9 Dec 2021 16:24:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8IfkRO017364 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 13:41:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 55CB2141DECB; Wed,  8 Dec 2021 18:41:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51564141DEC9
	for <linux-cachefs@redhat.com>; Wed,  8 Dec 2021 18:41:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 201B71DF15E1
	for <linux-cachefs@redhat.com>; Wed,  8 Dec 2021 18:41:46 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-402-iIsHZeO0NnanhbffBYnIPQ-1; Wed, 08 Dec 2021 13:41:44 -0500
X-MC-Unique: iIsHZeO0NnanhbffBYnIPQ-1
Received: by mail-ed1-f46.google.com with SMTP id z5so11567918edd.3
	for <linux-cachefs@redhat.com>; Wed, 08 Dec 2021 10:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=skLeJaSpw0/vsaEY+mYw5f7GsY+8sigTDomXYlalyaQ=;
	b=PKGhUOQmxz9lPp+r5c0k0CVtNcpUIog2HTnG5mxpsbtsfUa026C4Dj7nPHHchCyJU1
	wPYLyyePv2USjfqU6mKbGXTh66P5mstcNnxQXvL8WDjvK8Dp7dYQFvigduemsULnLPaq
	n41ToNYWLne0ChIuzNxOC5Xc4kvGBv2qXHkR159IJ3L5374m1IXXw4YRa7P7oRqnjvZO
	QQD4WoSg1546v/UTdWzLZnlM7vo4Y8loFuiGol9bwQBtA6+xgh9w1y9GBxA+t1coft82
	bBM76AXhiniO1ijZ3Ug3CXpEX6DFHGe+03zX930cHCzOi+I6bzVhkFVbth7oWxfmM6eA
	hSpw==
X-Gm-Message-State: AOAM533GgC7AWJFaExu+6e+Igia0lByKPpFFT/GqOH31jflwMDsZebH7
	Bg40542JkF47gDf5bB7ZjuUs1jaV/EKNotLxIcFw
X-Google-Smtp-Source: ABdhPJwzd+X2ZmGvjAeJGgn47kj3o0CAYIlLFGj0DvXH6heL09BQOS+lXEPboLTYzGvb5vpWRpawKty9Cs5cHbwwnEU=
X-Received: by 2002:a17:907:629b:: with SMTP id
	nd27mr9460277ejc.24.1638988902834; 
	Wed, 08 Dec 2021 10:41:42 -0800 (PST)
MIME-Version: 1.0
References: <163898788970.2840238.15026995173472005588.stgit@warthog.procyon.org.uk>
In-Reply-To: <163898788970.2840238.15026995173472005588.stgit@warthog.procyon.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Dec 2021 13:41:31 -0500
Message-ID: <CAHC9VhTP-HbRU1z66MOkSyw9w7vhK7Vq8p0FrxVfEX-+tSD43A@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Thu, 09 Dec 2021 11:24:01 -0500
Cc: linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, kolga@netapp.com,
	linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
	viro@zeniv.linux.org.uk, casey@schaufler-ca.com,
	linux-fsdevel@vger.kernel.org, anna.schumaker@netapp.com
Subject: Re: [Linux-cachefs] [RFC PATCH 1/2] security: Remove
	security_add_mnt_opt() as it's unused
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 8, 2021 at 1:25 PM David Howells <dhowells@redhat.com> wrote:
>
> Remove the add_mnt_opt LSM hook as it's not actually used.  This makes it
> easier to make the context pointers in selinux_mnt_opts non-const.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Alexander Viro <viro@zeniv.linux.org.uk>
> cc: Paul Moore <paul@paul-moore.com>
> cc: Casey Schaufler <casey@schaufler-ca.com>
> cc: selinux@vger.kernel.org
> cc: linux-security-module@vger.kernel.org
> cc: linux-nfs@vger.kernel.org
> cc: linux-cachefs@redhat.com
> ---
>
>  include/linux/lsm_hook_defs.h |    2 --
>  include/linux/lsm_hooks.h     |    2 --
>  include/linux/security.h      |    8 --------
>  security/security.c           |    8 --------
>  security/selinux/hooks.c      |   39 ---------------------------------------
>  5 files changed, 59 deletions(-)

There is already a patch in the selinux/next tree which does this.

  commit 52f982f00b220d097a71a23c149a1d18efc08e63
  Author: Ondrej Mosnacek <omosnace@redhat.com>
  Date:   Mon Dec 6 14:24:06 2021 +0100

   security,selinux: remove security_add_mnt_opt()

   Its last user has been removed in commit f2aedb713c28 ("NFS: Add
   fs_context support.").

   Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
   Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
   Signed-off-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

