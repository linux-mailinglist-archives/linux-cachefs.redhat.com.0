Return-Path: <linux-cachefs+bncBDLIXLMFVAERBGOZ36WAMGQETKOYLZQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E4825316
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Jan 2024 12:48:42 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-680b16b2cf1sf4019696d6.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 05 Jan 2024 03:48:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704455321; cv=pass;
        d=google.com; s=arc-20160816;
        b=FalUvaHEhRpYBC8sIAILPJ7VYMqlRxj7/U1QZvztvlupaPFInaZiJ+uG2nk3BrznFG
         m0pJM+w9sC4JakhazsFu5hsZF7kF2NPW+DGDGdEtQ+WxgzCcDXkKXZnc5p9xmeys9TNd
         vY8hYwZ+aFZm57dGvoK/Lsac/scGO57X3EJrISN+LR+gX1fBkv/1UhhLPNmxRiNgBJLI
         oboPnpACT79KeOm60dUuCOccqXdAaC+/WlvORqpdXUSGcA/sHfpdy91xnjM6rYWGVf3z
         RDZs76XRz+ckbzuZVRldH+4AVzWcoQa3/jRzaFqZHpGh2ddRQ0eV+f70VOSp0GPL/XZ7
         HEgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=WCtGpKsVAjzuLvv3+ZPRgI3g8mtBR2oduEBn7QezARo=;
        fh=5l+fFvxKOKoIwul6Y1zzzmXWDgRES562r//eGnX9aQs=;
        b=iWLENg86edRoFxrCRR2J0bBKN0hHf5zGseTe6jzIs4KAORkfR5Ia5J5kN+ZvTCBNJ4
         +juLxytfsY6BO9mn3TJVtR+i9ZUsWrZaxPoKOvDdZaR4cgN5EL9guDg/638a0facMg5S
         KptsofyUmkq6BcL784RDDX8kCWhggoqsNULQXpzAqrLXZ6h9AXuGTYZd6CYPAoR3Qi7t
         I30nJnccoIbqs0w1YVZVYWMimoEr79a37pqkldiHQdbFw0h/8gKj9AEZ056CluI/s3PK
         HmskUSEY93uLrqHP25ItT8A+V/KjhL00FEv5UjXgR22MnGeiJ+EsXo9wwfUDtuJCusnC
         /bHw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704455321; x=1705060121;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCtGpKsVAjzuLvv3+ZPRgI3g8mtBR2oduEBn7QezARo=;
        b=YqFFkdLzQgy1hlSchZW7/PWL7m29PQq7qt6otdAwzQypeWRYcHS/0FULLkGiOkrzOa
         TpZONiuiZ1Iwoe8nKQvWydatM819fs0Qd8XcDWMNV6065cAWFckf2rtvgOor/GaHznJF
         0fczOHdG3/yZsosJcPZEcZ4nausyDyqJZd8PQaGfyddXmLBuc4gtipgi5TS5ocIYwH4s
         MpzJljqWN0IQ0HdC5M6eoubjdpjzRp5NAqi5fMDH6TIqFhy6kZOOhDXpKPDlF8Bq9gN7
         gjqWnFQAiSMg7HAoYx2CCmjkO9msAOggTI2LwjnXEM6PP3QwUxSwaybIlU1Ww+fYXjLz
         6KNA==
X-Gm-Message-State: AOJu0YzyohjKyc8tJREPVAu1THU+ZwL+otJIsZbSuYn/So715La4n7/T
	rA3oiL7PhxS5w4NOEpwCsQHhfcWoOHv2zg==
X-Google-Smtp-Source: AGHT+IGx2pMBIRGd6UY2T1oyLAgyNt9wgbJ77isQfOoUigZPNieaq5U0Oy7NEnvBMixoykERGxTPXQ==
X-Received: by 2002:a05:6214:e4f:b0:680:c19c:5509 with SMTP id o15-20020a0562140e4f00b00680c19c5509mr3896170qvc.3.1704455321434;
        Fri, 05 Jan 2024 03:48:41 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:411c:b0:67f:74d3:afb5 with SMTP id
 kc28-20020a056214411c00b0067f74d3afb5ls333540qvb.1.-pod-prod-01-us; Fri, 05
 Jan 2024 03:48:41 -0800 (PST)
X-Received: by 2002:a67:f9ca:0:b0:467:c5e:b83a with SMTP id c10-20020a67f9ca000000b004670c5eb83amr1432717vsq.37.1704455320869;
        Fri, 05 Jan 2024 03:48:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704455320; cv=none;
        d=google.com; s=arc-20160816;
        b=L6HVchZ9ObF3NlV5KgiduiIF4l4KcPz5sMqaiU9F4UjhryQQ1iJbZr6qz5vCdZ+hZr
         EiiVw5c7Sz8isByrT/+CYQGJU/OSSep15CXddbIalr7lvSFbgpl4OVhHOcHoCrOe7Lrr
         79xbOL9YV7DyhE3AM61dAo4Tax/9JqgOyclvbwyczzVDg8PYXvs10bCG1JUEaGkpDyhk
         HCh9Q3EjTEFd4OKH0ipd+9TwKNKFtKpIE9ZUyz6hpLY7lUIwd6cdyOOd/klwPP/z1/PU
         zpBQY6msJJU/vMHcZJQGgRc8cTznroVAaPYnzV1NlF0FMeL/JBTYX7+ZMc5q6QpfmZ6a
         dJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=UdkuJrloY5z20GFvK63EYCIWOROt9myvl6AMcuZWPfc=;
        fh=5l+fFvxKOKoIwul6Y1zzzmXWDgRES562r//eGnX9aQs=;
        b=BLqHQNAGrbxDHcTMVVtnpEmE7o4LYRUvaySH8+ituE2vZ7wPxvhSTu1Dem8MGw3W4G
         yaXK/D4DbR7HZDSXsVS8WpdEF4N8cfIjic7EINP+pGdnPZDQn9Diyjtnc/X/Jky5QnFf
         IujD4VHgPYH9qfN08M6hYjgNDbrmrEmxs7qNzLnaQ8SCUvUZdGRrNkqnW0tlnoW6YY+E
         OGMZiOqbkMEK9H+0fuPIzaM3Yi2GPLXk7eA1X9C/F9DoN1UvKz/zQn/onHYNURQ1wxat
         /oPEieGatW3hqst+vBsTA2sYhwe2BF61AssNziPxnklOHYXnT1vzgld0GaOO6yyqhSG3
         vgzw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id jd16-20020a05622a719000b00429762fb08csi1571416qtb.560.2024.01.05.03.48.40
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 03:48:40 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-222-XovzAGUbO864S_yRbAMRwQ-1; Fri,
 05 Jan 2024 06:48:39 -0500
X-MC-Unique: XovzAGUbO864S_yRbAMRwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E19E1C05148
	for <linux-cachefs@gapps.redhat.com>; Fri,  5 Jan 2024 11:48:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 3B3331C060B1; Fri,  5 Jan 2024 11:48:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 153B51C060AF;
	Fri,  5 Jan 2024 11:48:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZeLAAf6qiieA5fy@casper.infradead.org>
References: <ZZeLAAf6qiieA5fy@casper.infradead.org> <2202548.1703245791@warthog.procyon.org.uk> <20231221230153.GA1607352@dev-arch.thelio-3990X> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-38-dhowells@redhat.com> <2229136.1703246451@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: dhowells@redhat.com, Nathan Chancellor <nathan@kernel.org>,
    Anna Schumaker <Anna.Schumaker@netapp.com>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix oops in NFS
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 11:48:35 +0000
Message-ID: <1098679.1704455315@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1098678.1704455315.1@warthog.procyon.org.uk>
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

Do you have CONFIG_NFS_FSCACHE set?  Are you using a cache?

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

