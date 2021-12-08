Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DFE46ED01
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 17:24:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-h8OjDnrtP82c_yq-CE5VGg-1; Thu, 09 Dec 2021 11:24:12 -0500
X-MC-Unique: h8OjDnrtP82c_yq-CE5VGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ADDB801B35;
	Thu,  9 Dec 2021 16:24:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 089585D9D5;
	Thu,  9 Dec 2021 16:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A0321809CB9;
	Thu,  9 Dec 2021 16:24:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8K5MYe024098 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 15:05:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2DE00C23DB3; Wed,  8 Dec 2021 20:05:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2992CC08094
	for <linux-cachefs@redhat.com>; Wed,  8 Dec 2021 20:05:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1005D811E78
	for <linux-cachefs@redhat.com>; Wed,  8 Dec 2021 20:05:22 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-531-5mTgJ2gNPRyKjxDska6wKw-1; Wed, 08 Dec 2021 15:05:20 -0500
X-MC-Unique: 5mTgJ2gNPRyKjxDska6wKw-1
Received: by mail-ed1-f52.google.com with SMTP id r11so11960708edd.9
	for <linux-cachefs@redhat.com>; Wed, 08 Dec 2021 12:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7ft5I8nfLjeZ/UkJIKaimQmlaiHw8YvU1BOwkkaA2CU=;
	b=LAyl/C2JLDC+A6kIEihH/cp0qB7Z49pgqN26qvP2dtLgbkvLgL0RPDiBpfTjULcBbY
	Ps2PO7FRyYX1PO4ADh0jaGGBUN5u+axDcFIMz/VcX3OORHFwovf1oNYzOS/nhuYwpvv9
	nE5CYenzfP1GMgliL2eMb/ljJps61j07u52OcePmWFwoFOvkPSGmHN4B2mJyUHBzojNV
	AEbPv2trpFce1Omvt+1P1dD0Umt+SdzIDVFjDmv20yu0nUL6nF4QKuej/2fOEYwlmTlw
	GiIsKHtFh0H8Il80poV6Mt1WathjlRPocpHWGkVJkneuTZhev9wcEYmnqqtKh3jj98K3
	f3LQ==
X-Gm-Message-State: AOAM532dja+iPuXN+dbkCd+VOW+sSS7w/61JLD7CJjs0Y/A0B/IejLlM
	rpS7NCNFaz3uS9xwTBovZKSJR9fsAv7k6bt5HR1e
X-Google-Smtp-Source: ABdhPJyAT5AcX24/vsaF4FuO3zmSI91sBLs+Bo7d3wsmD3mHwOXCNVYQbGhgfKwZE1LynLCP9HqwWfCtr/zzGD5cUOY=
X-Received: by 2002:aa7:cd5c:: with SMTP id v28mr22130323edw.6.1638993919043; 
	Wed, 08 Dec 2021 12:05:19 -0800 (PST)
MIME-Version: 1.0
References: <163898788970.2840238.15026995173472005588.stgit@warthog.procyon.org.uk>
	<CAHC9VhTP-HbRU1z66MOkSyw9w7vhK7Vq8p0FrxVfEX-+tSD43A@mail.gmail.com>
	<2846548.1638993312@warthog.procyon.org.uk>
In-Reply-To: <2846548.1638993312@warthog.procyon.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 8 Dec 2021 15:05:08 -0500
Message-ID: <CAHC9VhS4ZOWHD4+NnJ4uPbrQv1nookPovw23XoZ+=xOSeMZtEA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 8, 2021 at 2:55 PM David Howells <dhowells@redhat.com> wrote:
> Paul Moore <paul@paul-moore.com> wrote:
> > There is already a patch in the selinux/next tree which does this.

It appears to be, yes.

> Looks pretty much identical to mine.  Feel free to add:
>
>         Reviewed-by: David Howells <dhowells@redhat.com>

Thanks.  I generally don't update patches for metadata (unless it is
really critical) so I don't have to do a force push, but if we have to
I'll be sure to add your tag (there is a tag from James Morris that
came in late too).

-- 
paul moore
www.paul-moore.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

