Return-Path: <linux-cachefs+bncBDLIXLMFVAERBKWM72YAMGQEBND5FWY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74E8A810A
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 12:36:27 +0200 (CEST)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-436e10399b8sf12090381cf.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 03:36:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713350186; cv=pass;
        d=google.com; s=arc-20160816;
        b=0u4dQ1G6CHj6YE70UiPLGxaAzf9eOjxH4KYNuq7GmGe2YSUCHXteMokmDknAOt2v2a
         N/+vA2P518qN7VsBDVeuYwmKBOY9/EiVmJMJVVEIPDIULrik73GahkRaFk16DMRsc80X
         2XGwmRkaBats4ErFZD1q8ARqucQUkGbrnw9zkzfEtzyHcHDm6ZprgyOR6imP+BJPc4ju
         G9J/r3qdlKGX8ohmofFfxGYft+/6r+kgBhpeO1LNNWu5eGnaclCFEEb9biFrLmLr1nNl
         gvOdXxbluJw8SigR6Ya+K5B3TYQ5EeCITxlKRTcd7eAJXS8lPRfwW53Dlm2BKmeptKxI
         EHjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=oX0h9fJqCwQN7u8e7fClbyxMR2dKZkiyIqZmm5etPWI=;
        fh=V1uy34U8dTRV3zty2K1f4xUPtW4Ya0FbfWKWsmudFwA=;
        b=0r5+whI4L9QB1GcMgohX9yIVD2R+zyTJLjRJkVBbz9kvJLf5wQhzWP3tyMHoZEgi3U
         p5RI/DFy3+bfUc9bEFktgGDpPh0GdG6uQ+Knpa9RBAAuPVwH3Ndy8uLWr47kTmFYlXE2
         wWqIRCKsySmZBndpEN/8s/O4mD/1yE0T2zKIYWIRjQGx3UwsfEHPRHf+WPVGtdUVGXzH
         vfaZdRsT/RISAXnIucnD3ZVqrtds+Ha5s6svg49/l6PVAVNDAU/xv+GdyI63iQeUYT86
         KtS5eYrIamlOkhqZjL7BLuqMSyRWKJKjGyIDcqjgi7Fg9pkft2MOOeJqeQfKTamwoNaX
         jCdQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713350186; x=1713954986;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oX0h9fJqCwQN7u8e7fClbyxMR2dKZkiyIqZmm5etPWI=;
        b=U4LJombJ7cDWGM6Y7FLsswMYLcCiyPeEd8arlZLpWvABmVm9+1ztUJG7w39OWkUURJ
         Hk1xFm7PaVP1a49t6PDBxoB6fhJrIEniL1qSQPyd3TGcBb3lqNPScW9QUm329iNi05Fk
         dYXcTDpfw4+HRcqZtZVJReTcURhVbhIXKwUHsz4hoPCswoJBQu0peJobNgsUH7UJGSGA
         vKdjv5XY2LVoSk3Y4zENJGnh3fdMpCUY54cwdkttOWhjZ+pyYMnIPhZW0Y9WlZipPYQR
         0J/IN4Etkvenwpc/pmXDVoYUjcyoyToBwW+NMgQE5WuAdE+u9Te1ZMHPrLjV4H9PE90Q
         41yw==
X-Forwarded-Encrypted: i=2; AJvYcCW3Q/c7WT74n9VVaNWImMGl/zG9ZQr6h2c2UCf685SF+FkTOqrotiFNU7nCKN7SPoGY2na+oL+k5Kv3bPaMtjbViYpjXz77u8OnofA=
X-Gm-Message-State: AOJu0Ywhd8vIxyhoHO2otXMmUjoScQJVTl4XTOV/iG9y3JHGu9hzaLCv
	JRLOXd7Bh4dTqiClIT4+hKfppJjzm958A55coDgTc1Bgy9JC9QCHvXkckmRa6k4=
X-Google-Smtp-Source: AGHT+IG098cNhse1PrVQ0+ZtNdS+toWQulIQ1uxCMZDSxN7L/4EwbRuWJMG/XnjVLPabjUI6dnptUA==
X-Received: by 2002:ac8:5810:0:b0:437:7a8b:da56 with SMTP id g16-20020ac85810000000b004377a8bda56mr1199694qtg.11.1713350186554;
        Wed, 17 Apr 2024 03:36:26 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1188:b0:437:5ecf:5e62 with SMTP id
 m8-20020a05622a118800b004375ecf5e62ls1912867qtk.2.-pod-prod-00-us; Wed, 17
 Apr 2024 03:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCYeds0gNDqjk2OWQW7f4kImy5fEiqcLFgkGid3+krWkiJqBdLibWcUWKLmlmr7nOJy3m4xshGD3mPigrG3RPdHXgQUj2l+vo3NOqydOY=
X-Received: by 2002:a05:620a:8209:b0:78e:f360:454a with SMTP id ow9-20020a05620a820900b0078ef360454amr7251309qkn.25.1713350185768;
        Wed, 17 Apr 2024 03:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713350185; cv=none;
        d=google.com; s=arc-20160816;
        b=YzqGpsIVvSMa9VZdtnnrA+YKIzFy2idThFgTCn//iFYcyDSsvxhtojGFmyhNbxOpTz
         4/78Q6tICDbFlFmR6mW8eO9kcVlqcbZ4Vd4hxgKgMCTvsOUpqbxJ+N6zhpqDzthyELDI
         l0E9I/8TwphuEvXXNw8EmZ1nTVMkJXzHBpPIVb0iAbvJPPa1oMa5C6LxtlVVgyfz1m/i
         KoGLbO4AKtnY9Ykqn5AdUc9FR7y1hkgaKc8oJVfjKKYM0USDsy5CzeGhut5kgXp8T1Iq
         tFdEiFMAOsMt/wmdAE3RKCLkmXoghI5oTSpP7gvImh2J+Wj+qvFRIsWRXcd8C3DlbaAh
         e5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=oIJdAoOJD1/uhXCiQOPpdfvotOmhyFiedfiW/yeHsWQ=;
        fh=7gOFpuAQ0yAoOab2uNQ6H1pxrsYhhlKoHW6cDGyURI0=;
        b=W6GiRH/Me2Q/9fmOCFpcLUqQxS/cPqeGlYkLuK3qyZLdevzzIVjXnvlc6YseRN8PAu
         vEsGmgMV+e17gLLxnkHTBiLR5IHXOCTp9GYt+qQA/wFIt1aQhUoGoRLLQx5P3EILLRrK
         I+SfqJsMoEW0W2EBLQPVyKfmPVaPaSeZpe8rqc4MvBKi3jlJc3+7nrqDSNAzBWcAze4p
         i8eipTFvOCJ9PFSS1uW78/Q15OyRaSUuwVNJwd9BnKdKs4wkIqni7JZ8zkXemN2XTt7K
         +BDrr9Wg2QjmHBA/f6FG+P8c4W87JSLMIt6oPLsKDwx+uvQSHbs5ahAi6QkwhyuDVHLX
         xWkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id x13-20020a05620a0ecd00b0078d7562b898si14011943qkm.624.2024.04.17.03.36.25
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 03:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-GNjzQAx3M_i9fkasYCQDqA-1; Wed,
 17 Apr 2024 06:36:23 -0400
X-MC-Unique: GNjzQAx3M_i9fkasYCQDqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C0DD28EC11B
	for <linux-cachefs@gapps.redhat.com>; Wed, 17 Apr 2024 10:36:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 995832026964; Wed, 17 Apr 2024 10:36:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FDF82026962;
	Wed, 17 Apr 2024 10:36:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <87d451ff8cd030a380b522b4dfc56ca42c9de444.camel@kernel.org>
References: <87d451ff8cd030a380b522b4dfc56ca42c9de444.camel@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-25-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
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
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH 24/26] netfs: Remove the old writeback code
MIME-Version: 1.0
Date: Wed, 17 Apr 2024 11:36:15 +0100
Message-ID: <98241.1713350175@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <98240.1713350175.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

> #23 and #24 should probably be merged. I don't see any reason to do the
> two-step of ifdef'ing out the code and then removing it. Just go for it
> at this point in the series.

I would prefer to keep the ~500 line patch that's rearranging the plumbing
separate from the ~1200 line patch that just deletes a load of lines to make
the cutover patch easier to review.  I guess that comes down to a matter of
preference.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

