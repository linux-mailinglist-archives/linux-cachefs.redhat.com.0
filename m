Return-Path: <linux-cachefs+bncBDLIXLMFVAERBD4W36VAMGQE6G7IVYI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD637EF890
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 21:20:33 +0100 (CET)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1ef4f8d294asf2293136fac.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 12:20:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700252431; cv=pass;
        d=google.com; s=arc-20160816;
        b=GW7V+92jnhYp7hUpTOvKKlxlzJuav1zw0GVFSnhMNn/XHY1L1K25qIavoQDvuSksdj
         2Sv7zwJ8shSKtJ6xLM+cxLZ6zWWlciUqlYy/P/SjMais8Yn9U2to/mb5lqd+SDiW8OyC
         HEEG8nxcuDUkWFLP1/2oRV8K6utIHah7FQC8p8Ae+hxFyeJ37hC4UX6IARwlMye+9rhz
         VSzgfJOLY8IYlOyr7DbGOkOc3mFITGW3PfMrwmpW37SiLva9GJY+GIJQoHrqAQMlDBtP
         hsoHIeULjIRSCs1NF5AyrCJTByJINKng5SWqxModo6bcLaQy4OvN1NWr50GCMVV7z7NK
         bZvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=4mO3lzSjfz1HS19Jbxrdar7LEp3xxF8txNeZD8ophQc=;
        fh=sSAx+bUtldeKgKS5wET1oNYyKD1uRKp33QFaO2SDcsM=;
        b=QSEVAUZ5l7vZf2dC/f/atfIDF4KbWbvs1Nsh+aeUhUW/r4Chb7vVDxWvTarO1w7/Tv
         0YXJFq1L4ObRpaWa/OdpWMwUSNikT8eBpQlDUFaOGqz48b3gqAqaGMQuq+wVaIx1PRsq
         +X43jSJYtvkTujb+DZQzjyaU5wK32rA/iWvNaA1DsnvyW9ZGnRRQJJBb+KBDfc0s8eOK
         lzxEAkuK7r8jZf2Wg0wpl46PxxAExTRcrECaXD/jvr2fdUa0PNVUApEFUiorBfrkDxVH
         XXBezO4Y/o/19tVqiyP4XrsbaSqP0Of0eTL6I+VDvFZnbykT8lfJT2joqgwvnD6kVrwd
         kQXA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700252431; x=1700857231;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4mO3lzSjfz1HS19Jbxrdar7LEp3xxF8txNeZD8ophQc=;
        b=H1HoQ98cbU1AmkWOyOBvx94Klnk2uES/z7p2t8zA/NJ8Gr4HUmwtmmApLguwBT84/4
         P6gocsYp0GumxEyLztUg/C+7T0+8NK2iguU7XM+Y6+OCg4jwHe23I8vHQb40Wrs12BAL
         +2HYswA0sQxMU7Vo5Ga1FR/cHj9eL1Fkuw67az6SHuinZHY4JDqybaBdSlXKE/HcX0//
         frzNNV/LTdUvDje6WyM5jDSR4BqwRChACNPz99t/9m18QMkB4f4Ot8MMHMP3uf3HjDrl
         1ztnSv0hQlNbwlf80+HhyN4JHvxDn8xUysFwZpsaV0IuV7zc3JA6SpWl7YKHOkeZjMP+
         +Rnw==
X-Gm-Message-State: AOJu0YwtuoxlIYR60KHD6OAglP1jBIJI3QYXwGBZ0llwvN8vV4ysgjFD
	4q9gSQT28IywdUujkmX6S2hOmQ==
X-Google-Smtp-Source: AGHT+IFF7UKw3lJ0aP6fekSQCX9lTN+mda1FXh95mLIidQwq1hsFeYlbNht5GwbKI9scXL5TlBtzfQ==
X-Received: by 2002:a05:6870:d393:b0:1ef:c22c:78f2 with SMTP id k19-20020a056870d39300b001efc22c78f2mr282194oag.15.1700252431699;
        Fri, 17 Nov 2023 12:20:31 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:c394:b0:1f5:c384:29be with SMTP id
 g20-20020a056870c39400b001f5c38429bels298531oao.1.-pod-prod-01-us; Fri, 17
 Nov 2023 12:20:30 -0800 (PST)
X-Received: by 2002:a05:6808:487:b0:3a8:83df:d5a4 with SMTP id z7-20020a056808048700b003a883dfd5a4mr390556oid.59.1700252430874;
        Fri, 17 Nov 2023 12:20:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700252430; cv=none;
        d=google.com; s=arc-20160816;
        b=laa4a2JtMqBKw4h8+28kauWSJ+yasLOpk8qU9wOblj3O7itLu0D1zMW9YAOjNAK4xl
         2532p+U2u1nbfxecr2pavpM3Q0Zrr3E6dtPJz/GsAgOuGzzUXdsfBBPvmaFiBTGPMQTE
         C6R/C/rYioEXdKjXg3HXUSUVRRWIMKRbw803IVFG+sZAP/g/HskvHhYewco1tAzqYS+J
         qCHegYreIGHwxdKUxcSi8oYEor76FcnQobBvXtXZqGUw0nSkovmzeE/JjH+Mz+sWX2of
         jZyEAxjUnshJfz4wobU5f63bKAOLhwm0UtyLZI1Ata2KU+Do24qTOnemtrhOekFTElHj
         9Lew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=HSZYZLsv/5bI0p08i5GVaWzqBIei0iZ/u61pW5V/yJU=;
        fh=sSAx+bUtldeKgKS5wET1oNYyKD1uRKp33QFaO2SDcsM=;
        b=aA3AieTMKQGYOS/sNATXMgCV/L/iN6gv5g0egw3pnzcPCaIWPNBTyGBvCPKh5Q/VsP
         FQZBfTUV5+LF5+/xCYWaxaCiHAwGWR48ZWJbOgoDto/M80TRT5/eifnGMTPYT20rcC0u
         Y2yHlyv2L2IbtloJB/7gN+x5KT1NxKy1NMGEJWnPzTV09miJIOJAxqn6bv1vwNu2sQTA
         XyOdMpbG5opSei+fZwbScPuMlBAg8bgM/J3Zp5uS9N7orcF6rK7NR4wqokFE6B36m03i
         aYz3xccj2CrWht9DljjtAQ4eHRBdb1CC9FCXjNhCxslP1PAcsvuIKjcZnqqL5mBmzR9x
         r1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id f12-20020a05620a280c00b007758ffaef15si2463156qkp.522.2023.11.17.12.20.30
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:20:30 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-NqKeJP27PHaXdd2P3VIvBA-1; Fri, 17 Nov 2023 15:20:29 -0500
X-MC-Unique: NqKeJP27PHaXdd2P3VIvBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF318678A1
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 20:20:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EBF91C22542; Fri, 17 Nov 2023 20:20:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CF30C22541;
	Fri, 17 Nov 2023 20:20:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <bb0b02b4241da7f486cde28bdc83bb9ce077ee0e.camel@kernel.org>
References: <bb0b02b4241da7f486cde28bdc83bb9ce077ee0e.camel@kernel.org> <20231013160423.2218093-1-dhowells@redhat.com> <20231013160423.2218093-12-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-cachefs@redhat.com
Subject: Re: [RFC PATCH 11/53] netfs: Add support for DIO buffering
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 20:20:25 +0000
Message-ID: <1722479.1700252425@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1722478.1700252425.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

> > +	struct bio_vec		*direct_bv;	/* DIO buffer list (when handling iovec-iter) */
> >  	void			*netfs_priv;	/* Private data for the netfs */
> > +	unsigned int		direct_bv_count; /* Number of elements in bv[] */
> 
> nit: "number of elements in direct_bv[]"
> 
> Also, just for better readability, can you swap direct_bv and
> netfs_priv? Then at least the array and count are together.

Yeah - and stick a __counted_by() on too.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

