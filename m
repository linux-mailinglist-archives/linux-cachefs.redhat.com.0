Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8DF306811
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Jan 2021 00:40:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-_LXS3a-MNumeikeUfGfiMA-1; Wed, 27 Jan 2021 18:40:09 -0500
X-MC-Unique: _LXS3a-MNumeikeUfGfiMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C997100C600;
	Wed, 27 Jan 2021 23:40:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E2C119D9D;
	Wed, 27 Jan 2021 23:40:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 367D3180954D;
	Wed, 27 Jan 2021 23:40:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RMp9rI025212 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 17:51:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8415B2026D48; Wed, 27 Jan 2021 22:51:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F0822026D47
	for <linux-cachefs@redhat.com>; Wed, 27 Jan 2021 22:51:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 394AF811E84
	for <linux-cachefs@redhat.com>; Wed, 27 Jan 2021 22:51:07 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-eSS0qpL3N4mivxadYWOrXw-1; Wed, 27 Jan 2021 17:51:04 -0500
X-MC-Unique: eSS0qpL3N4mivxadYWOrXw-1
Received: by mail-io1-f44.google.com with SMTP id p72so3597807iod.12;
	Wed, 27 Jan 2021 14:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KghPEGZU40F6HmOvZcdkJbtEvvG/Mj5OqeU4qLAbrBk=;
	b=HCF5vnzQmtpH3gE1Z9e/VoAaVSuLsWZjvF0cYmsuQUmmoYz8SAFph3wx23U5GZUeBd
	Nch0V10hzdotRtI/iwq/86rFvL4LFQ/U2JFwRElWaQOBYVAtBCl0hIzUtw0/YxIEyQp+
	N2Fae+B33gpt6T2e01NrHnSL1pSiKQom1+P2HfyYPiIjHAEGI+dvZpCGWxhUYcnQnhSg
	KgBnjFL6MSl4ZIr6Y2EqmpvPP8Z+eA4cTf0Ki6SjsBtOwdRe2D4Hha6tdKka4/NQayFl
	/dg0Ru0POd1n6DeD58uqCOfL4QMXoa47y7IS3VS6PuimejFmy6J6jRm6vf0f6ZdxrG4V
	Vcjw==
X-Gm-Message-State: AOAM533UjSYeep0Ug4fzgG4u5pS169bQZeGppUMGM5K9n/O8KoyilkOj
	JXIb7xbVQPsb7hfch5DKDDeJNbfcCse6O8zju+9qprUtgxs=
X-Google-Smtp-Source: ABdhPJyStPj5yx4BQyvOfARFMCt/BHM1nSrzBANiCDQxLeyi5a1WXtZiIx64RxYivVviTPLOFL76WG/Pzxrtw611VEU=
X-Received: by 2002:a6b:2bca:: with SMTP id r193mr9525550ior.167.1611787863568;
	Wed, 27 Jan 2021 14:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20210126134103.240031-1-jlayton@kernel.org>
In-Reply-To: <20210126134103.240031-1-jlayton@kernel.org>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 27 Jan 2021 23:50:57 +0100
Message-ID: <CAOi1vP-3Ma4LdCcu6sPpwVbmrto5HnOAsJ6r9_973hYY3ODBUQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
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
X-Mailman-Approved-At: Wed, 27 Jan 2021 18:31:10 -0500
Cc: LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ceph Development <ceph-devel@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH 0/6] ceph: convert to new netfs read
	helpers
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

On Tue, Jan 26, 2021 at 2:41 PM Jeff Layton <jlayton@kernel.org> wrote:
>
> This patchset converts ceph to use the new netfs readpage, write_begin,
> and readahead helpers to handle buffered reads. This is a substantial
> reduction in code in ceph, but shouldn't really affect functionality in
> any way.
>
> Ilya, if you don't have any objections, I'll plan to let David pull this
> series into his tree to be merged with the netfs API patches themselves.

Sure, that works for me.

I would have expected that the new netfs infrastructure is pushed
to a public branch that individual filesystems could peruse, but since
David's set already includes patches for AFS and NFS, let's tag along.

Thanks,

                Ilya

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

