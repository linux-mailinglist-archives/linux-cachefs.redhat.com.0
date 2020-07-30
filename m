Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 79C482338E9
	for <lists+linux-cachefs@lfdr.de>; Thu, 30 Jul 2020 21:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596137043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GqMLmSWNQ+EQdZRoH4wPzwZMuncmu5W51Ooqwtfj/JU=;
	b=GlEJLB4LnSjqYeVV7NdCKjZtwtzKGT3eF3pOLN+yfRLwg7RBynqkNDCPwz+kKTJYNhkIcT
	Iik+EnPhxTj5oeNcj9Jqguqg7PbnrEykFOzhlZ91mxxrB7v8gTC8vJZrp+kUSW5iHXdbIB
	CiL8ZvW36JF+RNrpbciXskO5WpDjxQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-M329C8AgPx2aULoq4v3OzQ-1; Thu, 30 Jul 2020 15:24:02 -0400
X-MC-Unique: M329C8AgPx2aULoq4v3OzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4C17106B82D;
	Thu, 30 Jul 2020 19:23:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 070265D9D3;
	Thu, 30 Jul 2020 19:23:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D94C95A71;
	Thu, 30 Jul 2020 19:23:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UJNsrL030424 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 15:23:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C8A72156708; Thu, 30 Jul 2020 19:23:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 389362156A3A
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 19:23:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F275A188B2A7
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 19:23:51 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
	[209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-248-fr2o_NjqM6Gfuc83dd0zAw-1; Thu, 30 Jul 2020 15:23:50 -0400
X-MC-Unique: fr2o_NjqM6Gfuc83dd0zAw-1
Received: by mail-ej1-f70.google.com with SMTP id lg2so5403867ejb.23
	for <linux-cachefs@redhat.com>; Thu, 30 Jul 2020 12:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+aT95YXKHydqNbmosDDInfhjNMhb1Txx1Ai8NlXUGyE=;
	b=m7zdUIn3knrlVPRx1HdBRGpo9kRlkbxa5XF8I/EhwncQ74cy7oeguS8zJz59DbHkdA
	LoeZMI4aJ3Fg9FiKRXxJxJBvc9A7OXeazlEe5jnz2JdX0sKe4jOYpyl+QojP41bWKZWG
	2CX3AorvT6/zpiB5B8GXpDMHedLpFw5uB0wJh6Oo/a8oaHTtDgqT0zLySjhiQfdSiiIL
	f5iuWLTgA0y2GLXFyH2bI1nJnm/YZaIiaMplUMyX9jwH/hfbgifs36XWLhZ+OXLJZa9i
	iwyFa+AqV33xQZ2i+HSTMs0DBNbjD6dF03I4rQDAAZRMHKGyyn+rxZZ8J/iGJok6G4k8
	lJPA==
X-Gm-Message-State: AOAM530LuVZGGZYtXi2Z0g6xsQ5o8TwXmCNci2IwPjkXL50q3Wlqa6Kn
	ZSxYpTuvfCjvHStr/y3Gk2MPQ+AlxJyUWc3vGO8WnnGDRE7R0iWgtISFI9vij4HfYliyHgx5tL3
	uSgDR3OlnlSSGm5s+RJNZgjajFDh1fDpoJ74WgA==
X-Received: by 2002:a17:906:80d3:: with SMTP id
	a19mr603278ejx.217.1596137028989; 
	Thu, 30 Jul 2020 12:23:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycG9rBeUIHsgCY8h2f2jn12IQbdGXlTp7BsljVwDyNbNh3/sq0WRMoFb/ZExGnFfUpmFrQ7PWIDo82WDWHly0=
X-Received: by 2002:a17:906:80d3:: with SMTP id
	a19mr603265ejx.217.1596137028761; 
	Thu, 30 Jul 2020 12:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <1596031949-26793-1-git-send-email-dwysocha@redhat.com>
	<1596031949-26793-14-git-send-email-dwysocha@redhat.com>
	<43e8a8ff1ea015bb7bd335d5616268d36155327a.camel@redhat.com>
In-Reply-To: <43e8a8ff1ea015bb7bd335d5616268d36155327a.camel@redhat.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 30 Jul 2020 15:23:12 -0400
Message-ID: <CALF+zOnYLbibbYxvbyUJFJQ+NtcreuAvFkZYr9h3_qQswbMxRw@mail.gmail.com>
To: Jeff Layton <jlayton@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs <linux-nfs@vger.kernel.org>, linux-cachefs@redhat.com,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [RFC PATCH v2 13/14] NFS: Call
 fscache_resize_cookie() when inode size changes due to setattr
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2020 at 2:39 PM Jeff Layton <jlayton@redhat.com> wrote:
>
> On Wed, 2020-07-29 at 10:12 -0400, Dave Wysochanski wrote:
> > Handle truncate / setattr when fscache is enabled by calling
> > fscache_resize_cookie().
> >
> > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > ---
> >  fs/nfs/inode.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
> > index 45067303348c..6b814246d07d 100644
> > --- a/fs/nfs/inode.c
> > +++ b/fs/nfs/inode.c
> > @@ -667,6 +667,7 @@ static int nfs_vmtruncate(struct inode * inode, loff_t offset)
> >       spin_unlock(&inode->i_lock);
> >       truncate_pagecache(inode, offset);
> >       spin_lock(&inode->i_lock);
> > +     fscache_resize_cookie(nfs_i_fscache(inode), i_size_read(inode));
> >  out:
> >       return err;
> >  }
>
> truncate can happen even when you have no open file descriptors on the
> file and therefore w/o the cookie being "used". In the ceph vmtruncate
> handling code, I do an explicit use/unuse around this call. Do you need
> to do the same here?
> --
> Jeff Layton <jlayton@redhat.com>
>

Actually I think the case you mention is covered by a patch that I've just
added today on top of my v2 posting.
This was the result of looking deeper into a few xfstest failures with
NFSv4.2.  I think this covers the truncate without a file open:

commit 91d6922df9390ca1c090911be6e5c5ab1a79ea83
Author: Dave Wysochanski <dwysocha@redhat.com>
Date:   Thu Jul 30 12:33:40 2020 -0400

    NFS: Call fscache_invalidate() from nfs_invalidate_mapping()

    Be sure to invalidate fscache cookie for any call to
    nfs_invalidate_mapping().

    This patch fixes the following xfstests on NFS4.x:
      generic/240
    as well as fixes the following xfstests on NFSv4.2:
      generic/029 generic/030

    Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 6b814246d07d..62243ec05917 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -1233,6 +1233,7 @@ static int nfs_invalidate_mapping(struct inode
*inode, struct address_space *map
        struct nfs_inode *nfsi = NFS_I(inode);
        int ret;

+       nfs_fscache_invalidate(inode, 0);
        if (mapping->nrpages != 0) {
                if (S_ISREG(inode->i_mode)) {
                        ret = nfs_sync_mapping(mapping);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

