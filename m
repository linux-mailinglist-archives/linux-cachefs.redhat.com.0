Return-Path: <linux-cachefs+bncBDLIXLMFVAERB2GS2WWAMGQETODZJWY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AAD822F1F
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 15:04:25 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-594edc5b62bsf6136810eaf.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 06:04:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704290664; cv=pass;
        d=google.com; s=arc-20160816;
        b=rYdgNFd7e7JLUXau18aqsSbX5cMVWSHQpuBLgG6voKGhBOhxooS4Q0jnt78qXpTzNM
         3YzXlMsNvcr9fNvLkUkJ3odlYKKNHQsOwHkfoZ4gFc/tBXuNnJ59P08TbqPpSDeBo0nN
         rvFf4BcGLZ35BMSoWsbWTQIi/cuawh/0vbK1Hw5Y8qqAT9R8CS9o13A5iA4TXYdO0SC0
         CnsbvT8xyyHsUIVxqGdWVVDOvKnK4iSlHbidqWcoLuo1CNWRuK0+hAdEYi1uvYBqeWYU
         uHHbWDj9+xIePWFBENZvFP/sftW9TyZl+dFQBRW0Rf9G4Bi9Bfj54cX83BhsdFVE9KM2
         j6yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=68Mpaapl9QMh72cDypaTfmEXRH6kFRphstH1tSTayAQ=;
        fh=BhDS1KcRJvXXD2Bl9bhuhq83dMEXwTkkC0RH5v6iCzY=;
        b=nUKSHdr7NBW+NY7bVHIX38z/PbWaxeF7Eze+MsJPlupggdvM4IjEUp6QnXrIhnihPX
         IJ4v2mBWkAYFK8S7nt3k71Lh21Z9q5ngH2m6btswrJY89Lomyh6uQjl6HgC1/Vh8TKpK
         inMS+og6C2GkR8bGvPlQFUuptoIWMlcsGmChUyUUtctiOLFo2iVc1M8CD+1odCQiVLld
         zkVzAkrzYZQ42xSzmYYEsk2H0s03OPhIZgeG9Dg+YwitU1b+w3VGaGSKpSHxswJ4cbvX
         1Ei5KJEf9O3GxThOIeXsqB+sArr/NJ8yN5UheAPxEiEA9zT/Yox+WWonM8VxYwKSTL+4
         5mrg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704290664; x=1704895464;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68Mpaapl9QMh72cDypaTfmEXRH6kFRphstH1tSTayAQ=;
        b=GiKNC+YBL+Nd6BbLbewZomZJ0CItXP34ONZbFB2b6VX64petkpuYSQq0RVXEry91nM
         SlVeoR9aEWiL5XtywWXPeoxSBm+9pkSpPkYgTnK3/GtyHDRi/1kqxzX/mUYEMNGcXPfq
         Lsvsf9YM6FVJ/dlAZCxIrvPEAS+u50ESfwyXiZpkGVzXkEn6ipN9ei9v9IK6moN+8KXK
         QYANtahGrbEdBxXmPkxQoFCn8xnkG/8/ZxgaYqtzcurLjsr4U1MF5RLyd3/Q3GtpYDV6
         Gxxe7Dbnvx7bcD+3jb3jxl+BsZ0c/V7i7PZEh3zmXpPj1TNhTzAnoj0KInbT7aa3l4hp
         tedw==
X-Gm-Message-State: AOJu0YzfTxTW7UdeMM+ci/C5wyMkKQzUjCFmCNygHRuw/0EtzrPz8n1M
	VpoM5UwQeSGQk4sNtoFZBD+XsiJYU/f15w==
X-Google-Smtp-Source: AGHT+IGN65X8rC/q0i5s6G9RVJo4tA7evcmxSknqDZBuc64WPlebOgQncFNanWucW8Cl8Mg4PC77xg==
X-Received: by 2002:a4a:5142:0:b0:595:bc65:9ea9 with SMTP id s63-20020a4a5142000000b00595bc659ea9mr1985282ooa.18.1704290664514;
        Wed, 03 Jan 2024 06:04:24 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:5848:0:b0:594:9cf0:cf4b with SMTP id f69-20020a4a5848000000b005949cf0cf4bls1099299oob.0.-pod-prod-07-us;
 Wed, 03 Jan 2024 06:04:24 -0800 (PST)
X-Received: by 2002:a05:6808:2e9a:b0:3bb:c863:7c23 with SMTP id gt26-20020a0568082e9a00b003bbc8637c23mr13842022oib.67.1704290663901;
        Wed, 03 Jan 2024 06:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704290663; cv=none;
        d=google.com; s=arc-20160816;
        b=D6bxqjTO8G6cjEEmbDZ2kpw9NvR56657Q76DuXwgkF5KdTVejm07W8CrHkKvZJj6h/
         Ic3SvhsB2VwgDXHbwC1k8pmK/US30a8uh+ImFfHx5dJfeP7X7eCAf18kp8kuTsQ+AXvT
         HH4fh0t0fI3MbIvTR7/f+AoOvC+xbEO6jAfTj1sRRBN5/DJ2hyY6xVh7BWVJTqRj49Mn
         nt911oiCBpzMmFfFu6wqDNpBIdne1Xm+yiqoZBhZE/iOJGf/Ql2ToJGGBe5Uf/PnmotJ
         vAmQvA5Xer6/WXoXwPTukO67qzVcuA+tMxxzmJJ9owXGN/7rI91xY8CGuNgPWnj+7sgd
         bA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=dm5uQwn+49K96zJWxQsiqkazcQLayYKEShHZEQ+JYDg=;
        fh=BhDS1KcRJvXXD2Bl9bhuhq83dMEXwTkkC0RH5v6iCzY=;
        b=fe5EmwiNcXXMcr2RGGRjONKh5Y1ppWyvYdcuhzv7af74wkcA0TW3ilXNR3vuO9/8UL
         8wc76XkxjhzHWV4lbE5bmUxjWhBSwnrMTuLoJV5eatrEB3OAUifpm1shyPsQIf/O2kgn
         kijaZuDTDGGAZdgyzmQzfrwabT1a/h0gRXqhFVu3ZakowHTyLAUy8AboE+inMkJbXuOs
         WhNv7nDQ7DQf20ZJ+xv07lmG/0N+28VBAzI5L8IuI6w0OobXE3yHwPp9nhNrXv/7t2se
         dr3dj/wp42IbYgn2WGikG/8NJofrxOvTnjVWXwJO5N7qiu5BLvB3G//tHoY6YJhgp+vn
         e4Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y4-20020a67e8c4000000b0046702b96faesi1870781vsn.679.2024.01.03.06.04.23
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-ol8veiFZO3eFjqZ0x8E9oQ-1; Wed,
 03 Jan 2024 09:04:22 -0500
X-MC-Unique: ol8veiFZO3eFjqZ0x8E9oQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14A93285F982
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 14:04:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1148E2026D6F; Wed,  3 Jan 2024 14:04:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 372852026D66;
	Wed,  3 Jan 2024 14:04:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZVctju5TEjS218p@codewreck.org>
References: <ZZVctju5TEjS218p@codewreck.org> <20231221132400.1601991-41-dhowells@redhat.com> <20231221132400.1601991-1-dhowells@redhat.com> <292837.1704232179@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: dhowells@redhat.com, Eric Van Hensbergen <ericvh@kernel.org>,
    Latchesar Ionkov <lucho@ionkov.net>,
    Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH] 9p: Fix initialisation of netfs_inode for 9p
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 14:04:17 +0000
Message-ID: <368446.1704290657@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <368445.1704290657.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Dominique Martinet <asmadeus@codewreck.org> wrote:

> Would it make sense to just always update netfs's ctx->remote_i_size in
> the various stat2inode calls instead?

Btw, v9fs_i_size_write() should be redundant.  It should be sufficient to just
use i_size_write() as long as you use i_size_read().

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

