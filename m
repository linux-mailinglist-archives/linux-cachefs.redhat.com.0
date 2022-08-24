Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C559FC04
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 15:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661348791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M4torooUSVIj8GDIzFU80aquNw7oAOrfi6up1/waGV8=;
	b=WfFABP44sYyDdsH7NPqNpWIrrpiZ6guWApobM+rD1XB4JcQdQmpeE7xJDdvTNO+7ZGtsVF
	YjW/qje9qxBk97RFnCjU5XU6aqA54DNTiTHURYw6pTHca+QoVAPLSxvd6AOXqrclYDJWo7
	FOM2pI5WmD9OIAbID2Of/DoGMqOIq0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-Lz54PE3XO4aUu8piXdAgwg-1; Wed, 24 Aug 2022 09:46:27 -0400
X-MC-Unique: Lz54PE3XO4aUu8piXdAgwg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C54C85A58D;
	Wed, 24 Aug 2022 13:46:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6EDE40315A;
	Wed, 24 Aug 2022 13:46:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C57D31946A52;
	Wed, 24 Aug 2022 13:46:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9D3581946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 13:01:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8AC02C15BBA; Wed, 24 Aug 2022 13:01:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87506C15BB3
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 13:01:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B433E3C10151
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 13:01:50 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-sCrsGhffPByINOLCcboDqQ-1; Wed, 24 Aug 2022 09:01:38 -0400
X-MC-Unique: sCrsGhffPByINOLCcboDqQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso5117699ejc.18
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 06:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=QAPjAsJu7iOATQWB+c0GngHgi+xgKxQbdfkHrh5GaOU=;
 b=GwZjoZveMNg5Aum7BTGQZlv1b0hTorgGIcf67P48LGcGguaYFR7rXedSjN23OmMW6k
 HSbMqIABACDff9QnYbWjH+8BhM63SaBkmVhF07v4RmmxxlNmZJHCjsw0rpeMnri7/iny
 ZgFjCYG2YMOSOePQMe3wJAa+79GVHJ46+NUhNUf+s2gGJqw/Gfn8bgW/UVsz+tXegdqY
 QoRc3J2TfRcf/Ze3J+Akm/Q+aPqbrsIaZhX1uRsm77Mv6N5CnmXW0QDffIKKXJO5QcV4
 LhB5xzreukfxb03F/J46WkchtJZAr63tqALaruFS7WOny9d37U/5ex8fEoLMvPYr6+J4
 CgsA==
X-Gm-Message-State: ACgBeo3RaF7gcNsTkNSIWN+jgPSUnpr1aB4/qdYwMwJnA3paahrydwny
 dpqaLTZCNppYGZjUGpjwIJCRvqsIBcluyDA9rBnQReDYXORTfwXMJWFG3IynWrbKZ9J9+wxIeHO
 5ESrJhdqoiVhi8ifKDzL4RzJS8xmFSkKc3ESNjw==
X-Received: by 2002:a17:907:6da1:b0:73d:877d:c56c with SMTP id
 sb33-20020a1709076da100b0073d877dc56cmr2889268ejc.342.1661346092377; 
 Wed, 24 Aug 2022 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5joQw+U7+cpfBdVsHUHveN+r+mfIGsH2drD6D8wqkR8Ewtl6W7Ks6IwlXoBRTkKxUtCYhE/QHr7QpxyWLrVAE=
X-Received: by 2002:a17:907:6da1:b0:73d:877d:c56c with SMTP id
 sb33-20020a1709076da100b0073d877dc56cmr2889259ejc.342.1661346092168; Wed, 24
 Aug 2022 06:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220824093501.384755-1-dwysocha@redhat.com>
 <20220824093501.384755-3-dwysocha@redhat.com>
 <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
In-Reply-To: <429ecc819fcffe63d60dbb2b72f9022d2a21ddd8.camel@hammerspace.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Wed, 24 Aug 2022 09:00:56 -0400
Message-ID: <CALF+zOknvMZyufSUD-g9Z9Y5RfwE-vUFT+CF0kxqbcpR=yJPJw@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] NFS: Add support for netfs in
 struct nfs_inode and Kconfig
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "benmaynard@google.com" <benmaynard@google.com>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 24, 2022 at 8:42 AM Trond Myklebust <trondmy@hammerspace.com> wrote:
>
> On Wed, 2022-08-24 at 05:35 -0400, Dave Wysochanski wrote:
> > As first steps for support of the netfs library, add NETFS_SUPPORT
> > to Kconfig and add the required netfs_inode into struct nfs_inode.
> > The struct netfs_inode is now where the vfs_inode is stored as well
> > as the fscache_cookie.  In addition, use the netfs_inode() and
> > netfs_i_cookie() helpers, and remove our own helper, nfs_i_fscache().
> >
> > Later patches will enable netfs by defining NFS specific version
> > of struct netfs_request_ops and calling netfs_inode_init().
> >
> > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > ---
> >  fs/nfs/Kconfig         |  1 +
> >  fs/nfs/delegation.c    |  2 +-
> >  fs/nfs/dir.c           |  2 +-
> >  fs/nfs/fscache.c       | 20 +++++++++-----------
> >  fs/nfs/fscache.h       | 15 ++++++---------
> >  fs/nfs/inode.c         |  6 +++---
> >  fs/nfs/internal.h      |  2 +-
> >  fs/nfs/pnfs.c          | 12 ++++++------
> >  fs/nfs/write.c         |  2 +-
> >  include/linux/nfs_fs.h | 19 +++++--------------
> >  10 files changed, 34 insertions(+), 47 deletions(-)
> >
> > diff --git a/fs/nfs/Kconfig b/fs/nfs/Kconfig
> > index 14a72224b657..79b241bed762 100644
> > --- a/fs/nfs/Kconfig
> > +++ b/fs/nfs/Kconfig
> > @@ -5,6 +5,7 @@ config NFS_FS
> >         select LOCKD
> >         select SUNRPC
> >         select NFS_ACL_SUPPORT if NFS_V3_ACL
> > +       select NETFS_SUPPORT
> >
>
> NACK. I'm not at all OK with making netfs mandatory.
>

Just so we're on the same page, are you ok with netfs being enabled if
fscache is enabled like today?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

