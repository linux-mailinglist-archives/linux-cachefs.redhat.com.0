Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRNA72YAMGQE5PTR6HI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FBE8A7F01
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 11:03:03 +0200 (CEST)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c70a58a729sf3451087b6e.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 02:03:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713344582; cv=pass;
        d=google.com; s=arc-20160816;
        b=czZudQcFDItMSXv/tiFUGlRar3dvjn9va1Pgdl2FApL+G/uLSOnBVbtwDNjzoUTMco
         s/HqyuEYiNQqJdShDDhHlMNY1fQJcUbKOus8/mib6AqXw2tnFU3f4dLfAiYm8SoSfo0w
         kI0ohMcFApI7XClswwCOJeYjbaci1/LifqM/faTgBXlXZJCuU8eAuvUz7wZWuIzmfdNe
         QW0iqbWpmArPcIIVaViZrgJZDR4Hn6UIG/Mz9RuShUQLQg8pEczesVpiejdNHFc3wP+e
         zHlG6AxOvV1qeADm4v1LZKhJyt98JttXtqqufJWpi4PvE+Hqrvsb+NRbl3LqM4NFoTnd
         Z3sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=dzMkNzPm+mEaiss2mYKaT08g0oYWbUUAJD20rFTzxjs=;
        fh=FeIk4IUNYYPqUuHh2jFYJNJywSGwMAVvWUOfJYwEkXI=;
        b=JJrl/d6oNvvZaYvOthlhKuv3f+HQzvLvwju4d+DGOP7mbKTiuMxkYfKyTwPB2NtflQ
         4MlPk+lWAzj75nza3EFwOAuS/JMsUlnOnK83N0VR8CAIvzkllGqNf1OnCXGS1Hug5o49
         3D6luUiLQ/zgJdtSAyGa6ZWpSQVWlXIrz9iEvX+SyZATA1ln1vnqEQp1LCPalXtRHerS
         kFVlds9D1PLAVVw3V8qltPkphPat5SC/sykUT6hRnSPk7wUisvPNg7BhNf+IRh6CABKW
         g8cws2vdApv9CgZ3xWveyPUE9RQmp8CEGVz/IdzgOrRzBygnlq9+W1QGQidamlzSxyKn
         Q/Fg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713344582; x=1713949382;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzMkNzPm+mEaiss2mYKaT08g0oYWbUUAJD20rFTzxjs=;
        b=YzIPKfSXYLkoz8n9mc2+uvQ6LO6MsMsmIz5185WqoZXSLorXoRR4CSjcYV+zyhePM3
         Wh9bltQvdkT181MpnYJO/HgUZAQuP5GOHcagb4grMusIHIJnWQB06mXumD7dZQrYh1i3
         cxWv3op9pehEy564sBdcXpvm8FZg2evSVQIgVlQQCIEYgl3mCUZ46ts+DF+K9gcz7Kdm
         iu/h0+TV0/u/zDWxbhcEoBr1hPb/kSd8ybh12yVzLG5UJNZzKKZe0ywbMIgwkugSeXHQ
         xmsy97s6N/na4N4P4g7RM/72y27oEdqdwwfbhZd35MT1vkWs3z6WvRwJhX500VWy5hhg
         eUCQ==
X-Forwarded-Encrypted: i=2; AJvYcCXjkLscnwtHba6b6pJpP+XXZ6OEcTxmAWjQTUY4qtZEUrcys0rHhtb7r3GcP769aH+SHunzsU4rycR/TnmrWp4YDspHN/ZXjDkWvkI=
X-Gm-Message-State: AOJu0YxaL2Iv3nlIXyhIKAF+sTxGVgGOe+87Y5typGRt5ktchD7jxRxT
	0Ebu417qnqXmhdIwWhASqlT9MBR2KuEMAv+1xkTzjShFB89P0LsAEzdLqobH+4U=
X-Google-Smtp-Source: AGHT+IEOFh1U3Ddn8BBdEeGb3ErJeaeDGabKQNuciMPXEtt8dXr1OajomRu94zlNIgB1OO8jYtgeZw==
X-Received: by 2002:a54:438d:0:b0:3c5:fa6d:b052 with SMTP id u13-20020a54438d000000b003c5fa6db052mr16011056oiv.31.1713344581876;
        Wed, 17 Apr 2024 02:03:01 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:190f:b0:432:d61d:2fbe with SMTP id
 w15-20020a05622a190f00b00432d61d2fbels16379qtc.2.-pod-prod-03-us; Wed, 17 Apr
 2024 02:03:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlzPQYY6jc8FgonYoOFV6nR6zf87q7b1OsP2+ukYgKEacK0r3M+4F9399ihNGE7m/kq15w8xjRok1Y6nS8mPr2wq5En35ItAV2vHBi4tc=
X-Received: by 2002:a05:620a:a13:b0:78e:de25:fb3e with SMTP id i19-20020a05620a0a1300b0078ede25fb3emr10086120qka.71.1713344581172;
        Wed, 17 Apr 2024 02:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713344581; cv=none;
        d=google.com; s=arc-20160816;
        b=WMe9fccpJGzoQhQXruSlZQLN8+6IDtIZ4erSIIoS/qBqsu/Hhcr+EK20b0qmwQ0Bw4
         5GdyU/4irXrYl6Z+nmoaOfu47LE9ZYoPkrkcV2UYqtFZNrRWvjNdbNfKXEkiEDh4D4lc
         SU9NoWswaWbV/kA2Zc76Cz1C6VibSUIpHoG3sRpmMl8YZJ7dAJDNOycFTA7m6HXn22VP
         e2JOfVuJ232a2scdFwYyS6H5OCzHd92vk2EBRg7ViF8AgL38iS3zFkQdSDLZ9y1yFGJj
         7dStE2jRhBRP/mvlcT96L87A4C/PCzSWEppocgYbUWFm5IQiwXBLuZjhL5W2fAq63jiK
         g0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=+cqHolZFVcFPpeLBdV05ZqicpNbJqZRKW17Kvjt/Abs=;
        fh=wv07p+SphtOB3n5uI2VwLwR2XUPUSxt1LhLj1cvJV6U=;
        b=lNQZrqFRQX3WKpk2LcSUGujZIUdXudOujzzqkITFQIg3hEJNobU4G7uLJlgptIepNk
         AUsuWrkdpV6tAoHmWEjRbdvn2KIrsDg7W0JMfICAR7Txh52jAOE2t/oXcgSdNVrTOxWr
         d94smCinvqXMuKHDSzW3vEJ79JJWYL4hnK7ngAykD8h26EgDMoRt2L9cwBqfmjB6MjX+
         sh2WaiPbZNrN3Gxcbs98D44i7qbRhxUdGyaCxIuOKKkdhtJlTMLe2G/SuyVcJjIqWIn1
         9wWPyni3hvEs6nZQ8enBeWTShxDhlMa3+efo67ATjp0YuI11Jxi0TrnsYJGOP6gUbJcI
         X04Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c17-20020a05620a269100b0078d5ffbd6eesi16026076qkp.755.2024.04.17.02.03.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 02:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-9SD0zNKfOYmeJIs9wq59qg-1; Wed, 17 Apr 2024 05:02:59 -0400
X-MC-Unique: 9SD0zNKfOYmeJIs9wq59qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6AC10499A6
	for <linux-cachefs@gapps.redhat.com>; Wed, 17 Apr 2024 09:02:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 147D5C13FA9; Wed, 17 Apr 2024 09:02:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F32BC13FA2;
	Wed, 17 Apr 2024 09:02:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3570373a3db66151033a3667cb8c28bbf8bc505b.camel@kernel.org>
References: <3570373a3db66151033a3667cb8c28bbf8bc505b.camel@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-10-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
    Christian Brauner <christian@brauner.io>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Christoph Hellwig <hch@lst.de>,
    Andrew Morton <akpm@linux-foundation.org>,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Christian Brauner <brauner@kernel.org>, devel@lists.orangefs.org
Subject: Re: [PATCH 09/26] mm: Provide a means of invalidation without using launder_folio
MIME-Version: 1.0
Date: Wed, 17 Apr 2024 10:02:48 +0100
Message-ID: <28263.1713344568@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <28262.1713344568.1@warthog.procyon.org.uk>
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

Jeff Layton <jlayton@kernel.org> wrote:

> I'd have liked to have seen the first caller of this function too.

Looking again at my code, I also need to make netfs_unbuffered_write_iter()
use this function too.  I missed it before because that wasn't calling
invalidate_inode_pages2_range() directly, but rather going through
kiocb_invalidate_pages().

So I'll add those changes into this patch to give you a first caller.  I also
then need to make filemap_invalidate_inode() take a byte range.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

